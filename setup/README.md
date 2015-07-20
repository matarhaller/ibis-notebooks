# Cloudera Quickstart VM

## TL;DR

    curl -s https://raw.githubusercontent.com/cloudera/ibis-notebooks/master/setup/bootstrap.sh | bash

## Single Steps

To use Ibis with the special Cloudera Quickstart VM follow the below
instructions:

  * Install Oracle VirtualBox
  * Make sure Anaconda is installed. You can get it from
    `http://continuum.io/downloads`. Now prepend the Anaconda Python
    to your path like this `export PATH=$ANACONDA_HOME/bin:$PATH`
  * `pip install ibis-framework`
  * `git clone https://github.com/cloudera/ibis-notebooks.git`
  * `cd ibis-notebooks`
  * `./setup/setup-ibis-demo-vm.sh`
  * `source setup/ibis-env.sh`
  * `ipython notebooks`

## VM setup

The setup script will download a VirtualBox appliance image and import it in
VirtualBox. In addition, it will create a new host only network adapter with
DHCP. After the VM is started, it will extract the current IP address and
add a new /etc/hosts entry pointing from the IP of the VM to the hostname
"quickstart.cloudera". The reason for this entry is that Hadoop and HDFS
require a working reverse name mapping. If you don't want to run the automated
steps make sure to check the individual steps in the file
"setup/setup-ibis-demo-vm.sh".
