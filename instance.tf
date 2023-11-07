resource "google_compute_address" "external_ip" {
  name = "power-external-ip"
  region = var.region
}

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
    access_config {
      nat_ip = google_compute_address.external_ip.address
    }
  }

  metadata = {
    ssh-keys       = "tehila:${file("/github/home/.ssh/id_rsa.pub")}"
    startup-script = templatefile("${path.module}/startup-script.sh", { external_ip = google_compute_address.external_ip.address })
  }
}

resource "google_compute_firewall" "firewalls" {
  name    = "power-firewall"
  network = google_compute_network.ntwk.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-4000"]
  }
  
  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_network" "ntwk" {
  name = "power-network"
}
