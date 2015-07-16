#!/bin/bash
set +eux
IBIS_NB_HOME=https://github.com/cloudera/ibis-notebooks.git

git clone ${IBIS_NB_HOME}
pushd ibis-notebooks
pushd setup

./setup-ibis-demo-vm.sh

popd
