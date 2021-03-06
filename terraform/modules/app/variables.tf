variable public_key_path {
  description = "Path to the public key used for ssh access"
}
variable app_disk_image {
  description = "Disk image for reddit app"
  default = "reddit-app-base"
}
variable subnet_id {
description = "Subnets for modules"
}
variable lb_count {
  description = "Balancer Count"
  default     = "1"
}
variable env {
  description = "Prod or Stage"
}
variable db_ip {
  description = "db ip-address"
}
variable private_key_path {
  description = "path to private key"
}
