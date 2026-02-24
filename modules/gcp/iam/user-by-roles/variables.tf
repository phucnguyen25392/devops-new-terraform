variable "project" {
  description = "(Required) The project id of the target project. This is not inferred from the provider."
  type        = string
}

variable "role" {
  description = "(Required except for google_project_iam_audit_config) The role that should be applied. Only one google_project_iam_binding can be used per role. Note that custom roles must be of the format [projects|organizations]/{parent-name}/roles/{role-name}"
  type        = string
}

variable "members" {
  description = "An email address that represents a specific Google account. For example, alice@gmail.com or joe@example.com."
  type        = list(string)
  default     = []
}

variable "condition" {
  description = "(Optional) An IAM Condition for a given binding"
  type        = list(any)
  default     = []
}