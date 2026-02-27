variable "project_id" {
  description = "The ID of the project in which the resource belongs."
  type        = string
}

variable "name" {
  description = "A unique name for the resource, required by GCE."
  type        = string
}

variable "machine_type" {
  description = "The machine type to create."
  type        = string
  default     = "n1-standard-1"
}

variable "zone" {
  description = "The zone that the machine should be created in."
  type        = string
  default     = "us-central1-a"
}

variable "tags" {
  description = "A list of network tags to attach to the instance."
  type        = list(string)
  default     = []
}

variable "boot_disk_image" {
  description = "The image from which to initialize this disk."
  type        = string
  default     = "debian-cloud/debian-11"
}

variable "boot_disk_size" {
  description = "The size of the image in gigabytes."
  type        = number
  default     = 20
}

variable "boot_disk_type" {
  description = "The GCE disk type. Such as pd-standard, pd-balanced or pd-ssd."
  type        = string
  default     = "pd-standard"
}

variable "network" {
  description = "The name or self_link of the network to attach this interface to."
  type        = string
}

variable "subnetwork" {
  description = "The name or self_link of the subnetwork to attach this interface to."
  type        = string
}

variable "static_ip" {
  description = "The static IP address to assign to the instance's network interface."
  type        = string
  default     = null
}

variable "service_account_email" {
  description = "The service account e-mail address. If not given, the default Google Compute Engine service account is used."
  type        = string
  default     = null
}

variable "service_account_scopes" {
  description = "A list of service scopes. Both OAuth2 URLs and gcloud short names are supported."
  type        = list(string)
  default     = ["cloud-platform"]
}

variable "labels" {
  description = "A map of key/value label pairs to assign to the instance."
  type        = map(string)
  default     = {}

  validation {
    condition     = length(var.labels) <= 10
    error_message = "Maximum 10 labels allowed."
  }

  validation {
    condition = alltrue([
      for k, v in var.labels :
      can(regex("^[a-z][a-z0-9_-]{0,62}$", k)) &&
      can(regex("^[a-z0-9_-]{0,63}$", v))
    ])
    error_message = "Invalid GCP label format."
  }
}

variable "metadata" {
  description = "Metadata key/value pairs to make available from within the instance."
  type        = map(string)
  default     = {}
}
