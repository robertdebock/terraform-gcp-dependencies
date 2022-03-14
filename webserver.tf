resource "google_compute_instance" "webserver" {
  name         = "webserver"
  machine_type = "e2-medium"
  zone         = "us-central1-a"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    network = "default"
  }
  metadata = {
    ssh-keys = "username:${file("id_rsa.pub")}"
  }
}
