#!/bin/sh
export CONSUL_SOCKET=$CONSUL_SOCKET
export APP=$APP

if [ -z $CONSUL_SOCKET ]; then
  echo "CONSUL_SOCKET required";
  exit 1;
else
  echo "Consul Socket: $CONSUL_SOCKET"
fi

if [ -z $APP ]; then
  echo "APP required";
  exit 1;
else
  echo "Application: $APP"
fi


exec nginx &
consul-template \
  -consul $CONSUL_SOCKET \
  -template "/etc/consul/nginx.ctmpl:/etc/nginx/nginx.conf:exec nginx -s reload" 