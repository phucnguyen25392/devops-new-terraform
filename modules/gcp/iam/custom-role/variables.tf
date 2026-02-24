variable "role_id" {
  description = "(Required) The camel case role id to use for this role. Cannot contain - characters."
  type        = string
}

variable "title" {
  description = "(Required) A human-readable title for the role."
  type        = string
}

variable "permissions" {
  description = "(Optional) The project that the service account will be created in. Defaults to the provider project configuration."
  type        = list(string)
  default     = []
}

variable "stage" {
  description = "(Optional) The current launch stage of the role. Defaults to GA. List of possible stages is here."
  type        = string
  default     = "GA"
}

variable "description" {
  description = "(Optional) A human-readable description for the role."
  type        = string
  default     = ""
}