
resource "google_compute_instance" "vm_instance" {
  count        = 3
  name         = "cesi-maalsi23-infal112-instance-${count.index + 1}"
  machine_type = "e2-medium"
  zone         = "europe-west9-b"

  # Define the network interface using the VPC
  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {}  # This gives the instance a public IP
  }

  # Assign the appropriate SSH key for each instance
  metadata = {
    ssh-keys = "maalsi:$(file('keys/maalsi-${count.index + 1}.pub'))"
  }

  # Run the initialization script on first boot
  metadata_startup_script = file("init-scripts/instance.sh")

  # Boot disk configuration
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
}

