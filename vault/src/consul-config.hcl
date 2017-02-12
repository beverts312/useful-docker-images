backend "consul" {
  address = "##CONSUL_SOCKET##"
  path = "vault"
  advertise_addr = "http://##HOSTNAME##"
}

listener "tcp" {
  address = "##HOSTNAME##:8200"
  tls_disable = 1
}
