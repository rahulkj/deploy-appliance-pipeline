#!/bin/bash -ex

pushd ./govc
tar -zxf govc_Linux_x86_64.tar.gz
chmod +x ./govc
GOVC_CMD=$PWD/govc
popd

# FILE_PATH=`find ./product/ -name *.ova`

echo "$APPLIANCE_SETTINGS" > appliance-settings.yml

yq eval -j -I=0 appliance-settings.yml > appliance-settings.json

$GOVC_CMD import.ova -options=appliance-settings.json $APPLIANCE_OVA_LOCATION