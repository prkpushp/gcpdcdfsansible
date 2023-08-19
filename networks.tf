resource "google_compute_network" "my_network" {
  name                    = "my-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "windows_subnet" {
  name          = "windows-subnet"
  ip_cidr_range = "10.0.1.0/24"
  network       = google_compute_network.my_network.self_link
  region        = "us-central1"
}

resource "google_compute_subnetwork" "windows_subnet_east1" {
  name          = "windows-subnet-east1"
  ip_cidr_range = "10.0.3.0/24"
  network       = google_compute_network.my_network.self_link
  region        = "us-east1"
}

resource "google_compute_subnetwork" "linux_subnet" {
  name          = "linux-subnet"
  ip_cidr_range = "10.0.2.0/24"
  network       = google_compute_network.my_network.self_link
  region        = "us-central1"
}

resource "google_compute_firewall" "allow_ssh_ping_windows" {
  name    = "allow-ssh-ping-windows"
  network = google_compute_network.my_network.name

  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }

  allow {
    protocol = "tcp"
    ports    = ["5985"]
  }

    allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow_ssh_ping_linux" {
  name    = "allow-ssh-ping-linux"
  network = google_compute_network.my_network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
}
