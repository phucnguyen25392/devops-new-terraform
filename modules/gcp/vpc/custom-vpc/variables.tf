variable "network_name" {
  description = "The name of the network being created"
  type        = string
}

variable "project_id" {
  description = "The ID of the project where this network will be created"
  type        = string
}

variable "description" {
  description = "An optional description of this resource. The resource must be recreated to modify this field."
  type        = string
  default     = ""
}

variable "routing_mode" {
  description = "The network-wide routing mode to use. If set to REGIONAL, this network's cloud routers will only advertise routes with subnets of this network in the same region as the router. If set to GLOBAL, this network's cloud routers will advertise routes with all subnets of this network, across regions."
  type        = string
  default     = "GLOBAL"
}

variable "auto_create_subnetworks" {
  description = "When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the 10.128.0.0/9 address range. When set to false, the network is created in 'custom subnet mode' so the user can explicitly connect subnetwork resources."
  type        = bool
  default     = false
}

variable "delete_default_routes_on_create" {
  description = "If set to true, default routes (0.0.0.0/0) will be deleted immediately after network creation. Defaults to false."
  type        = bool
  default     = false
}

variable "subnets" {
  description = "The list of subnets being created"
  type = list(object({
    name                     = string
    ip_cidr_range            = string
    region                   = string
    description              = optional(string)
    private_ip_google_access = optional(bool)
    secondary_ip_range = optional(list(object({
      range_name    = string
      ip_cidr_range = string
    })))
    log_config = optional(object({
      aggregation_interval = string
      flow_sampling        = number
      metadata             = string
    }))
  }))
  default = []
}
