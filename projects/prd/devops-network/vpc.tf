provider "google" {
  project = var.account_id
}

module "vpc" {
  source       = "../../../modules/gcp/vpc/custom-vpc"
  network_name = var.network_name
  project_id   = var.account_id

  subnets = [
    {
      name          = "subnet-01"
      ip_cidr_range = "10.0.1.0/24"
      region        = var.region
      description   = "subnet-01"
    },
    {
      name                     = "subnet-02"
      ip_cidr_range            = "10.0.2.0/24"
      region                   = var.region
      private_ip_google_access = true
      secondary_ip_range = [
        {
          range_name    = "pod-range"
          ip_cidr_range = "192.168.64.0/22"
        },
        {
          range_name    = "svc-range"
          ip_cidr_range = "192.168.1.0/24"
        }
      ]
    }
  ]
}
