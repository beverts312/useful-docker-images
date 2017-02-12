## confd-nginx  
Lightwieght confd-nginx image for use with registrator.
Only supports etcd backend.  

### Configuration  
`APP` - This should be the key the ip's and ports you are trying to load balancer are registered on  
`ETCD_SOCKET` - This should be the IP and port of your etcd cluster  

## consul-nginx  
Lightwieght nginx image with consul-template for use with registrator.  

### Configuration  
`APP` - This should be the key the ip's and ports you are trying to load balancer are registered on  
`CONSUL_SOCKET` - This should be the IP and port of your consul cluster  

## Example usage  
Prereq: You have registrator properly configured.  
If you are using etcd:  
1. Set the `ETCD_SOCKET` env variabale locally or update [docker-compose.yml](./confd/docker-compose.yml) to the `IP:PORT` of your etcd instance that registrator is configured to register on (port is usually 2379).  
2. Use `docker-compose scale nginx=1 app=3` on this [compose file](./confd/docker-compose.yml)  
3. Visit your nginx container at `$CONTAINERIP/hostname`, and refresh a few times. You should notice it cycling through the `app` container ID's.  


If you are using consul:  
1. Set the `CONSUL_SOCKET` env variabale locally or update [docker-compose.yml](./consul/docker-compose.yml) to the `IP:PORT` of your consul instance that registrator is configured to register on (port is usually 8500).  
2. Use `docker-compose scale nginx=1 app=3` on this [compose file](./consul/docker-compose.yml)  
3. Visit your nginx container at `$CONTAINERIP/hostname`, and refresh a few times. You should notice it cycling through the `app` container ID's.  

## Troubleshooting  
Check etcd/consul to ensure you can see the keys, IP's and ports are being registered as expected.  
Make sure your network is configured in a way in which the nginx containers being deployed and the registrator instances can communicate with your etcd/consul cluster.  

## Known Issues  
The `confd-nginx` image cannot communicate with multiple etcd instances behind a load balancer (atleast in some cases). To work around this you will need to use the IP:PORT of an instance behind the load balancer