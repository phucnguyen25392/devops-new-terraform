output "deleted" {
  description = "The current deleted state of the role."
  value       = google_project_iam_custom_role.this.deleted
}

output "description" {
  description = "A human-readable description for the role."
  value       = google_project_iam_custom_role.this.description
}

output "id" {
  description = "an identifier for the resource with the format projects/{{project}}/roles/{{role_id}}"
  value       = google_project_iam_custom_role.this.id
}

output "name" {
  description = "The name of the role in the format projects/{{project}}/roles/{{role_id}}. Like id, this field can be used as a reference in other resources such as IAM role bindings."
  value       = google_project_iam_custom_role.this.name
}

output "permissions" {
  description = "The names of the permissions this role grants when bound in an IAM policy. At least one permission must be specified."
  value       = google_project_iam_custom_role.this.permissions
}

output "project" {
  description = "The project that the service account will be created in. Defaults to the provider project configuration."
  value       = google_project_iam_custom_role.this.project
}

output "role_id" {
  description = "The camel case role id to use for this role. Cannot contain - characters."
  value       = google_project_iam_custom_role.this.role_id
}

output "stage" {
  description = "The current deleted state of the role."
  value       = google_project_iam_custom_role.this.stage
}

output "title" {
  description = "A human-readable title for the role."
  value       = google_project_iam_custom_role.this.title
}