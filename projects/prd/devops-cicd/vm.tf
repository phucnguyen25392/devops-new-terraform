provider "google" {
  project = var.account_id
}

locals {
  virtual_machines = {
    "vms" = {
      name            = "vm-cicd"
      zone            = var.zone
      machine_type    = "n1-standard-1"
      tags            = var.tags
      boot_disk_image = "debian-cloud/debian-11"
      boot_disk_size  = 10
      network         = data.terraform_remote_state.network.outputs.vpc_name
      subnetwork      = data.terraform_remote_state.network.outputs.subnets["asia-southeast1/subnet-01"].name
      labels          = var.common_tags
    }
  }
}

module "vm" {
  for_each = local.virtual_machines

  source     = "../../../modules/gcp/compute/vm"
  project_id = var.account_id
  name       = each.value.name
  zone       = each.value.zone

  machine_type = each.value.machine_type
  tags         = each.value.tags

  boot_disk_image = each.value.boot_disk_image
  boot_disk_size  = each.value.boot_disk_size

  network    = each.value.network
  subnetwork = each.value.subnetwork

  labels = each.value.labels
}
