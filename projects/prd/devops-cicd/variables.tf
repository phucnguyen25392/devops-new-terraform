variable "zone" {
  description = "The zone that the machine should be created in."
  type        = string
  default     = "asia-southeast1-a"
}

variable "tags" {
  description = "A list of network tags to attach to the instance."
  type        = list(string)
  default     = ["test"]
}

variable "common_tags" {
  description = "Define common tags for this project"
  type        = map(string)
  default = {
    "Center"     = "prd"
    "Brand"      = "white-label"
    "Department" = "devops"
    "Team"       = "devops"
    "Handler"    = "devops@gmail.com"
    "Managed-by" = "Terraform"
  }
}
