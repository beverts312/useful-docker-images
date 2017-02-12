#!/bin/sh
if [ "${MODE}" == "etcd" ]; then
  sed -i "s|##ETCD_SOCKET##|$ETCD_SOCKET|g" ${MODE}-config.hcl
elif [ "${MODE}" == "consul" ]; then
  sed -i "s|##CONSUL_SOCKET##|$CONSUL_SOCKET|g" ${MODE}-config.hcl
elif [ "${MODE}" == "s3" ]; then
  sed -i "s|##BUCKET##|$BUCKET|g" ${MODE}-config.hcl
else
  mkdir secrets
  MODE="file"
fi

sed -i "s|##HOSTNAME##|$(hostname)|g" ${MODE}-config.hcl
./vault server -config ${MODE}-config.hcl