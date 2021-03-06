resource "yandex_compute_instance" "app" {
  count = var.lb_count
  name = "reddit-app-${var.env}-${count.index}"

  labels = {
    tags = "reddit-app"
  }
  resources {
    core_fraction = 100
    cores         = 2
    memory        = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.app_disk_image
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat = true
  }

  metadata = {
  ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

  connection {
    type        = "ssh"
    host        = self.network_interface.0.nat_ip_address
    user        = "ubuntu"
    agent       = false
    private_key = file(var.private_key_path)
  }

  /*provisioner "file" {
    source      = "../modules/app/puma.service"
    destination = "/tmp/puma.service"
  }

  provisioner "remote-exec" {
    inline = [
      "echo export DATABASE_URL=${var.db_ip} >> ~/.profile",
    ]
  }

  provisioner "remote-exec" {
    script = "../modules/app/deploy.sh"
  }
*/
}
