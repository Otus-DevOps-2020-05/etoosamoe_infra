variable db_disk_image {
  description = "Disk image for reddit db"
  default = "reddit-db-base"
}
variable subnet_id {
description = "Subnets for modules"
}
variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable lb_count {
  description = "Balancer Count"
  default     = "1"
}
variable private_key_path {
  description = "path to private key"
}