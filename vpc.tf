
resource "google_compute_network" "vpc_network" {
  name = "cesi-maalsi23-infal112"
}

resource "google_compute_firewall" "default_tcp" {
  name    = "default-allow-tcp"
  network = google_compute_network.vpc_network.self_link

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  source_ranges = ["0.0.0.0/0"]
}

