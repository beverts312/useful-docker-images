backend "etcd" {
  bucket = "##BUCKET##"
}

listener "tcp" {
  address = "##HOSTNAME##:8200"
  tls_disable = 1
}
