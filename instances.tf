resource "google_compute_address" "dc1_public_ip" {
  name         = "dc1-public-ip"
  address_type = "EXTERNAL"
}

resource "google_compute_address" "dc2_public_ip" {
  name         = "dc2-public-ip"
  address_type = "EXTERNAL"
}

resource "google_compute_instance" "dc1" {
  name         = "dc1"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"
  boot_disk {
    initialize_params {
      image = "windows-server-2022-dc-v20230510"
    }
  }

  network_interface {
    network       = google_compute_network.my_network.id
    subnetwork    = google_compute_subnetwork.windows_subnet.name
	access_config {
      nat_ip = google_compute_address.dc1_public_ip.address
    }
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    # Add your startup script commands here
  EOF
}


resource "google_compute_instance" "dc2" {
  name         = "dc2"
  machine_type = "n1-standard-1"
  zone         = "us-central1-b"
  boot_disk {
    initialize_params {
      image = "windows-server-2022-dc-v20230510"
    }
  }

  network_interface {
    network       = google_compute_network.my_network.id
    subnetwork    = google_compute_subnetwork.windows_subnet.name
    access_config {
      nat_ip = google_compute_address.dc2_public_ip.address
    }
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    # Add your startup script commands here
  EOF
}

resource "google_compute_instance" "dfs1" {
  name         = "dfs1"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"
  boot_disk {
    initialize_params {
      image = "windows-server-2022-dc-v20230510"
    }
  }

  network_interface {
    network       = google_compute_network.my_network.id
    subnetwork    = google_compute_subnetwork.windows_subnet.name
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    # Add your startup script commands here
  EOF
}

resource "google_compute_instance" "dfs2" {
  name         = "dfs2"
  machine_type = "n1-standard-1"
  zone         = "us-central1-b"
  boot_disk {
    initialize_params {
      image = "windows-server-2022-dc-v20230510"
    }
  }

  network_interface {
    network       = google_compute_network.my_network.id
    subnetwork    = google_compute_subnetwork.windows_subnet.name
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    # Add your startup script commands here
  EOF
}

resource "google_compute_instance" "dfs3" {
  name         = "dfs3"
  machine_type = "n1-standard-1"
  zone         = "us-east1-b"
  boot_disk {
    initialize_params {
      image = "windows-server-2022-dc-v20230510"
    }
  }

  network_interface {
    network       = google_compute_network.my_network.id
    subnetwork    = google_compute_subnetwork.windows_subnet_east1.name
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    # Add your startup script commands here
  EOF
}