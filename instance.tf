resource "google_compute_instance" "power_instance" {
  name         = "power-instance"
  machine_type = "e2-medium"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    network = "default"
  }

  metadata = {
    startup-script = templatefile("${path.module}/startup-script.sh", { external_ip = google_compute_address.external_ip.address })
  }

  provisioner "file" {
    source      = "${path.module}/id_rsa.pub"
    destination = "/home/tehila/.ssh/authorized_keys"
  }

  connection {
    type        = "ssh"
    user        = "tehila"
    private_key = file("${path.module}/id_rsa")
    host        = google_compute_address.external_ip.address
  }
}

resource "google_compute_address" "external_ip" {
  name   = "power-external-ip"
  region = var.gcp_region
}
