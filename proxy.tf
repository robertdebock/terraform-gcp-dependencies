resource "google_compute_instance" "proxy" {
  name         = "proxy"
  machine_type = "e2-medium"
  zone         = "us-central1-a"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    network = "default"
    access_config {}
  }
  metadata = {
    ssh-keys = "username:${file("id_rsa.pub")}"
  }
  depends_on = [google_compute_instance.webserver]
}
