resource "google_project_iam_binding" "this" {
  project = var.project
  role    = var.role
  members = var.members

  dynamic "condition" {
    for_each = var.condition
    content {
      title       = condition.value.title
      description = lookup(condition.value, "description", "")
      expression  = condition.value.expression
    }
  }
}