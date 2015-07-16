#!/bin/bash
set +eux

: ${VIRTUALBOX_URL:=http://archive.cloudera.com/cloudera-ibis/ibis-demo.ova}
: ${VIRTUALBOX_NAME:=ibis-demo}

# VM Settings default.
: ${VM_NAME:=ibis-demo}
: ${VM_NUM_CPUS:=2}
: ${VM_MEM_MB:=8192}

# Download quickstart VM
curl -Os ${VIRTUALBOX_URL}
OVF=${VIRTUALBOX_NAME}.ova

# Create a host only network interface
VBoxManage hostonlyif create

# Find the last one created
last_if=`VBoxManage list -l hostonlyifs | grep "^Name:" | tail -n 1 | tr " " "\n" | tail -n 1`
host_ip=`VBoxManage list -l hostonlyifs | grep "^IPAddress:" | tail -n 1 | tr " " "\n" | tail -n 1`

lower_ip=`echo $host_ip | sed 's/\([0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\)\.[0-9]\{1,3\}/\1/g'`

VBoxManage hostonlyif ipconfig $last_if --ip $host_ip
VBoxManage dhcpserver add --ifname $last_if --ip $host_ip --netmask 255.255.255.0 --lowerip $lower_ip.100 --upperip $lower_ip.200
VBoxManage dhcpserver modify --ifname $last_if --enable

# Import the ovf
VBoxManage import ${OVF} --vsys 0 --cpus ${VM_NUM_CPUS} --memory ${VM_MEM_MB} --vmname ${VM_NAME} --options keepallmacs
VBoxManage modifyvm ${VM_NAME} --nic1 hostonly
VBoxManage modifyvm ${VM_NAME} --hostonlyadapter1 $last_if
# Start the VM
VBoxManage startvm ${VM_NAME}

echo "Wait until services become available."
# Wait until we can access the DFS
while true; do
    val=`VBoxManage guestproperty get $VM_NAME "/VirtualBox/GuestInfo/Net/0/V4/IP"`
    if [[ $val != "No value set!" ]]; then
	ip=`echo $val | awk '{ print $2 }'`
	curl http://$ip:50070/ &> /dev/null
	if [[ $? -eq 0 ]]; then
	    break
	fi
    fi
    sleep 5
done

check=`grep quickstart.cloudera /etc/hosts`
if [[ ! $? -eq 0 ]]; then
echo "Updating the /etc/hosts file requires sudo rights."
sudo bash -e -c 'echo "#Cloudera Quickstart VM" >> /etc/hosts'
sudo bash -c "echo $ip quickstart.cloudera >> /etc/hosts"
else
echo "Hostname setup already done, check if the IP address of the VM"
echo "matches the hosts entry."
echo "IP VM: $ip"
cat /etc/hosts
fi

echo "========================================================================="
echo "Cloudera Quickstart VM installed successfully"
echo ""
echo "To continue: "
echo "  - Make sure Anaconda Python is in your Path"
echo "  - source setup/ibis-env.sh"
echo ""
echo " Then run 'ipython notebook' from the ibis-notebooks directory"
