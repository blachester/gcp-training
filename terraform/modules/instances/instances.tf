resource "google_compute_instance" "tf-instance-1" {
  name         = "tf-instance-1"
  machine_type = "e2-medium"
  zone         = "us-east1-c"

  tags = ["foo", "bar"]

  boot_disk {
    auto_delete = "true"
    device_name = "boot"
    mode        = "READ_WRITE"
    source      = "https://www.googleapis.com/compute/v1/projects/qwiklabs-gcp-03-48195c3f6b51/zones/us-east1-c/disks/tf-instance-1"
  }



  network_interface {
    access_config {
      nat_ip       = "35.196.101.243"
      network_tier = "PREMIUM"
    }

    network            = "https://www.googleapis.com/compute/v1/projects/qwiklabs-gcp-03-48195c3f6b51/global/networks/default"
    network_ip         = "10.142.0.2"
    stack_type         = "IPV4_ONLY"
    subnetwork         = "https://www.googleapis.com/compute/v1/projects/qwiklabs-gcp-03-48195c3f6b51/regions/us-east1/subnetworks/default"
    subnetwork_project = "qwiklabs-gcp-03-48195c3f6b51"
  }

  metadata = {
    goog-dm = "qldm-26210365-963953f4bddf099c"
  }


	metadata_startup_script = <<-EOT
			#!/bin/bash
		EOT
	allow_stopping_for_update = true

 service_account {
    email  = "qwiklabs-gcp-03-48195c3f6b51@qwiklabs-gcp-03-48195c3f6b51.iam.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}
