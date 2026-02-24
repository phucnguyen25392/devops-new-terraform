output "role" {
  description = "The role that should be applied. Only one google_project_iam_binding can be used per role. Note that custom roles must be of the format [projects|organizations]/{parent-name}/roles/{role-name}."
  value       = google_project_iam_binding.this.role
}

output "project" {
  description = "The project id of the target project. This is not inferred from the provider."
  value       = google_project_iam_binding.this.project
}

output "condition" {
  description = "An IAM Condition for a given binding."
  value       = google_project_iam_binding.this.condition
}

output "id" {
  description = "an identifier for the resource with format projects/{{project}}/roles/{{role}}"
  value       = google_project_iam_binding.this.id
}

output "members" {
  description = " Identities that will be granted the privilege in role."
  value       = google_project_iam_binding.this.members
}

output "etag" {
  description = "(Computed) The etag of the project's IAM policy."
  value       = google_project_iam_binding.this.etag
}