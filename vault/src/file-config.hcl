backend "file" {
  path = "/vault/secrets"
  advertise_addr = "http://##HOSTNAME##"
}

listener "tcp" {
  address = "##HOSTNAME##:8200"
  tls_disable = 1
}