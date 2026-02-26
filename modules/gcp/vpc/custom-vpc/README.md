# GCP VPC Module with Custom Subnets

This module creates a GCP VPC network and allows for the creation of custom subnets.

## Usage

```hcl
module "vpc" {
  source       = "./modules/gcp/vpc/custom-vpc"
  network_name = "example-vpc"
  project_id   = "my-project-id"

  subnets = [
    {
      name          = "subnet-01"
      ip_cidr_range = "10.10.10.0/24"
      region        = "us-central1"
    },
    {
      name          = "subnet-02"
      ip_cidr_range = "10.10.20.0/24"
      region        = "us-central1"
      secondary_ip_range = [
        {
          range_name    = "secondary-01"
          ip_cidr_range = "192.168.10.0/24"
        }
      ]
    }
  ]
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| network\_name | The name of the network being created | `string` | n/a | yes |
| project\_id | The ID of the project where this network will be created | `string` | n/a | yes |
| description | An optional description of this resource. | `string` | `""` | no |
| routing\_mode | The network-wide routing mode to use (REGIONAL or GLOBAL). | `string` | `"GLOBAL"` | no |
| auto\_create\_subnetworks | When set to true, the network is created in 'auto subnet mode'. | `bool` | `false` | no |
| delete\_default\_routes\_on\_create | If set to true, default routes (0.0.0.0/0) will be deleted immediately. | `bool` | `false` | no |
| subnets | The list of subnets being created | `list(any)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| network\_name | The name of the VPC being created |
| network\_id | The ID of the VPC being created |
| network\_self\_link | The URI of the VPC being created |
| subnets | The created subnetworks |
