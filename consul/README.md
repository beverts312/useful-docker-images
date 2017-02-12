Dockerized version of [Consul by Hashicorp](https://www.consul.io/)

###Usage  
| Vars/Values | Description | UI |
|-------------|-------------|----|
|`MODE=custom`| Essentially makes your entrypoint `consul agent "$@"`|configurable|
|`MODE=agent` && `SECURE!=true` | Starts consul in agent mode with [this config](./src/agent.json)|no|
|`MODE=agent` && `SECURE=true` | Starts consul in agent mode and uses `$ACL_TOKEN` with all requests|no|
|`MODE != (agent or custom)` && `SECURE=true` | Starts consul in server mode, uses `$ACL_MASTER_TOKEN` for management, Blacklist all services|yes|
|`MODE != (agent or custom)` && `SECURE!=true`  | Starts consul in agent mode and uses `$ACL_TOKEN` with all requests|yes|
