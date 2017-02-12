#!/bin/sh
export ETCD_SOCKET=$ETCD_SOCKET
export ETCD_APP=$ETCD_APP

if [ -z $ETCD_SOCKET ]; then
  echo "ETCD_SOCKET required";
  exit 1;
fi

if [ -z $ETCD_APP ]; then
  echo "ETCD_APP required";
  exit 1;
else
  echo "Application: $ETCD_APP"
fi

sed -i "s|<%ETCD_APP%>|$ETCD_APP|g" /etc/confd/templates/nginx.conf.tmpl
sed -i "s|<%ETCD_APP%>|$ETCD_APP|g" /etc/confd/conf.d/nginx.toml

until confd -onetime -node $ETCD_SOCKET -config-file /etc/confd/conf.d/nginx.toml; do
    echo "[nginx] waiting for confd to create initial nginx configuration."
    sleep 5
done

echo "[nginx] confd is now monitoring etcd for changes..."
confd -interval 5 -backend etcd -node $ETCD_SOCKET &
echo "[nginx] starting nginx service..."
cat /etc/nginx/nginx.conf
exec nginx