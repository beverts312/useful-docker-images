backend "etcd" {
  address = "##ETCD_SOCKET##"
  path = "vault"
  sync = "no"
  advertise_addr = "http://##HOSTNAME##"
}

listener "tcp" {
  address = "##HOSTNAME##:8200"
  tls_disable = 1
}
