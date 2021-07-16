#!/bin/bash -ex

wget -O mc https://dl.min.io/client/mc/release/linux-amd64/mc
chmod +x ./mc

wget ${APPLIANCE_OVA_LOCATION}

./mc alias set minio http://${MINIO_TARGET} ${MINIO_USERNAME} ${MINIO_PASSWORD}

OVA_LOCATION=$(find ./ -name *.ova)

./mc cp ${OVA_LOCATION} minio/${MINIO_BUCKET}