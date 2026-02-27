resource "google_compute_instance" "this" {
  name         = var.name
  project      = var.project_id
  machine_type = var.machine_type
  zone         = var.zone

  tags   = var.tags
  labels = var.labels

  boot_disk {
    initialize_params {
      image = var.boot_disk_image
      size  = var.boot_disk_size
      type  = var.boot_disk_type
    }
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork

    dynamic "access_config" {
      for_each = var.static_ip != null ? [1] : []
      content {
        nat_ip = var.static_ip
      }
    }
  }

  service_account {
    email  = var.service_account_email
    scopes = var.service_account_scopes
  }

  metadata = var.metadata

  lifecycle {
    ignore_changes = [
      metadata["ssh-keys"],
    ]
  }
}
