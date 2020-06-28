output "external_ip_address_app" {
  value = yandex_compute_instance.app.network_interface.0.nat_ip_address
}
output "application_name" {
  value = yandex_compute_instance.app.name
}
output "instance_hostname" {
  value = yandex_compute_instance.app.hostname
}
output "instance_external_ip" {
  value = "data.yandex_compute_instance_group.my_group.instances.*.network_interface.0.nat_ip_address"
}
