#!/bin/bash -ex

pushd ./govc
tar -zxf govc_Linux_x86_64.tar.gz
chmod +x ./govc
GOVC_CMD=$PWD/govc
popd

# FILE_PATH=`find ./product/ -name *.ova`

echo "$APPLIANCE_SETTINGS" > appliance-settings.yml

yq eval -j -I=0 appliance-settings.yml > appliance-settings.json

APPLIANCE_NAME=$(cat appliance-settings.json | jq -r '.Name')

APPLIANCE_DNS=$($GOVC_CMD vm.info --json ${APPLIANCE_NAME} | jq -r '.VirtualMachines[] | .Guest | .HostName')

$GOVC_CMD vm.destroy -vm.dns=$APPLIANCE_DNS