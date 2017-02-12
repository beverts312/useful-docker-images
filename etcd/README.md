Dockerized etcd designed for easy clustering.  
### Configuration  
This Docker image supports 2 different modes, one is bootstrapping using an exisitng cluster, the other is by statically identifying initial cluster members. 
If the `${DISCOVERY_URL}` environmental variable is set, the image will use that mode otherwise it will use the other mode.  

| Variable    | Mode     | Description                                    |
|-------------|----------|------------------------------------------------|
| IP          | all      | IP of the machine the container is running on  |
|DISCOVERY_URL|discovery | Discovery url to bootstrap your service with   |
|INIT_CLUSTER |static    | Initial cluster arg (see static-compose.yml)   |
|NAME         |static    | Name of the node, must be unique in the cluster|
  
### Sample Compose Files  
I have prepared 2 sample compose files.  
To use an existing cluster to bootstrap yours look at `docker-compose.yml` (this would be executed on each node).  
To use a static list to initialize your cluster look at `static-compose.yml` (this would be executed on each node).


### References  
Based off: https://github.com/colebrumley/docker-etcd  
Clustering Guide from: https://coreos.com/etcd/docs/latest/clustering.html#etcd-discovery  
Service Discovery Example: https://discovery.etcd.io/new?size=3  
API Docs: https://coreos.com/etcd/docs/latest/api.html  
Docs: https://coreos.com/etcd/docs/2.0.10/  

