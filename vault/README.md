Dockerized version of [Vault by Hashicorp](https://www.vaultproject.io)  

### Usage  
Set the `MODE` variable to determine which backend to use (defaults to file).  
Be sure to set your container hostname appropriately if you are using a HA backend (etcd, consul). 

|Mode|Description|Status|
|----|--------|------|
|file|writes to `/vault/secrets`, mount this for persistence|working|
|consul|set `CONSUL_SOCKET` to consul endpoint|untested|
|etcd|set `ETCD_SOCKET` to etcd endpoint|untested|
|s3|set `BUCKET` to your bucket name, use AWS CLI vars for access, secret, & region|untested|  