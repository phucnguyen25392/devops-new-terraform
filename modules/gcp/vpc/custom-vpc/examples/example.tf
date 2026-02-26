provider "google" {
  project = "my-project-id"
  region  = "us-central1"
}

module "demo_vpc" {
  source       = "../"
  network_name = "demo-vpc"
  project_id   = "my-project-id"

  subnets = [
    {
      name          = "demo-subnet-01"
      ip_cidr_range = "10.0.1.0/24"
      region        = "us-central1"
      description   = "First demo subnet"
    },
    {
      name                     = "demo-subnet-02"
      ip_cidr_range            = "10.0.2.0/24"
      region                   = "us-east1"
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

output "vpc_id" {
  value = module.demo_vpc.network_id
}

output "subnet_ids" {
  value = { for k, v in module.demo_vpc.subnets : k => v.id }
}
