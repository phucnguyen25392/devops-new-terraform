provider "google" {
  project = "cdg-gcp-playground"
}

variable "custom_roles" {
  type = any
  default = {
    team_system_test = {
      title       = "Team System Test"
      description = "Role for team system test"
      permissions = ["iam.roles.list", "iam.roles.create", "iam.roles.delete"]
    }
  }
}

# Custom Role
module "custom_role_examples" {
  source   = "../"
  for_each = var.custom_roles

  role_id     = each.key
  title       = each.value.title
  description = each.value.description
  permissions = each.value.permissions
}