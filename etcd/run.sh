#!/bin/sh
ETCD_CMD="/bin/etcd -data-dir=/data -initial-advertise-peer-urls http://${IP}:2380 -listen-peer-urls http://0.0.0.0:2380 -listen-client-urls http://0.0.0.0:2379 -advertise-client-urls http://${IP}:2379"

if [ -z $DISCOVERY_URL ]
then
  echo "DISCOVERY_URL not specified, going with static list"
  echo "Initial Cluster: ${INIT_CLUSTER}"
  ETCD_CMD="${ETCD_CMD} -name ${NAME}  -initial-cluster ${INIT_CLUSTER}"
else
  echo "Using etcd Discovery Service to bootstrap cluster"
  ETCD_CMD="${ETCD_CMD} -name $(hostname) -discovery ${DISCOVERY_URL}"
fi

ETCD_CMD="${ETCD_CMD} $*"

echo -e "Running '$ETCD_CMD'\nBEGIN ETCD OUTPUT\n"

$ETCD_CMD

echo -e "\nETCD HAS DIED\n"