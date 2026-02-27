# GCP VM Module

This module creates a Google Compute Engine instance.

## Usage

```hcl
module "vm" {
  source     = "../../modules/gcp/compute/vm"
  project_id = "my-project"
  name       = "my-instance"
  zone       = "us-central1-a"
  network    = "my-vpc"
  subnetwork = "my-subnet"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project_id | The ID of the project in which the resource belongs. | `string` | n/a | yes |
| name | A unique name for the resource, required by GCE. | `string` | n/a | yes |
| machine_type | The machine type to create. | `string` | `"n1-standard-1"` | no |
| zone | The zone that the machine should be created in. | `string` | `"us-central1-a"` | no |
| tags | A list of network tags to attach to the instance. | `list(string)` | `[]` | no |
| boot_disk_image | The image from which to initialize this disk. | `string` | `"debian-cloud/debian-11"` | no |
| boot_disk_size | The size of the image in gigabytes. | `number` | `20` | no |
| boot_disk_type | The GCE disk type. | `string` | `"pd-standard"` | no |
| network | The name or self_link of the network to attach this interface to. | `string` | n/a | yes |
| subnetwork | The name or self_link of the subnetwork to attach this interface to. | `string` | n/a | yes |
| static_ip | The static IP address to assign to the instance's network interface. | `string` | `null` | no |
| service_account_email | The service account e-mail address. | `string` | `null` | no |
| service_account_scopes | A list of service scopes. | `list(string)` | `["cloud-platform"]` | no |
| labels | A map of key/value label pairs to assign to the instance. | `map(string)` | `{}` | no |
| metadata | Metadata key/value pairs to make available from within the instance. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| instance_name | The name of the VM instance. |
| instance_id | The server-assigned unique identifier of this resource. |
| self_link | The URI of the created resource. |
| private_ip | The internal IP address of the instance. |
| public_ip | The external IP address of the instance, if applicable. |
