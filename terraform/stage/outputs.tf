output "external_ip_address_app" {
  value = module.app.*.external_ip_address_app
}
output "external_ip_address_db" {
  value = module.db.*.external_ip_address_db
}
output "internal_ip_address_db" {
  value = module.db.*.internal_ip_address_db
}
/*output "internal_ip_adress_app" {
  value = yandex_compute_instance.app.*.network_interface.0.ip_address
}
output "load_balancer_ext_ip" {
  value = yandex_lb_network_load_balancer.reddit_lb.listener.*.external_address_spec.0.address
}
*/
