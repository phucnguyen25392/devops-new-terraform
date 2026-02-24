output "account_id" {
  description = "(Required) The account id that is used to generate the service account email address and a stable unique id. It is unique within a project, must be 6-30 characters long, and match the regular expression [a-z]([-a-z0-9]*[a-z0-9]) to comply with RFC1035. Changing this forces a new service account to be created"
  value       = google_service_account.this.account_id
}

output "description" {
  description = "(Optional) A text description of the service account. Must be less than or equal to 256 UTF-8 bytes"
  value       = google_service_account.this.description
}

output "disabled" {
  description = " (Optional) Whether a service account is disabled or not. Defaults to false. This field has no effect during creation. Must be set after creation to disable a service account"
  value       = google_service_account.this.disabled
}

output "display_name" {
  description = "(Optional) The display name for the service account. Can be updated without creating a new resource"
  value       = google_service_account.this.display_name
}

output "email" {
  description = "The e-mail address of the service account. This value should be referenced from any google_iam_policy data sources that would grant the service account privileges"
  value       = google_service_account.this.email
}

output "id" {
  description = "an identifier for the resource with format projects/{{project}}/serviceAccounts/{{email}}"
  value       = google_service_account.this.id
}

output "name" {
  description = "The fully-qualified name of the service account"
  value       = google_service_account.this.name
}

output "project" {
  description = "The ID of the project that the service account will be created in. Defaults to the provider project configuration"
  value       = google_service_account.this.project
}

output "unique_id" {
  description = "The unique id of the service account"
  value       = google_service_account.this.unique_id
}

# binding
output "roles" {
  description = "(Optional) An IAM Condition for a given binding"
  value       = google_service_account_iam_binding.this
}

# policy
output "policies" {
  description = "(Optional) An IAM Condition for a given binding"
  value       = google_service_account_iam_policy.this
}

# key
output "keys" {
  description = "(Optional) An IAM Condition for a given binding"
  value       = [for account_key in google_service_account_key.this : account_key.id]
}