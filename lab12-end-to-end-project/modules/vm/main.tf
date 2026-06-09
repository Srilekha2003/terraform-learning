resource "google_compute_instance" "vm" {

  name         = var.vm_name
  machine_type = "e2-micro"
  zone         = "asia-south1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork

    access_config {}
  }
}