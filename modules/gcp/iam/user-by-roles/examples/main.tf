provider "google" {
  project = "cdg-gcp-playground"
}

variable "roles" {
  type = any
  default = {
    "roles/iam.serviceAccountUser" = {
      members = ["user:thai@fossil.com"]
      condition = [
        {
          title       = "expires_after_2022_12_31"
          description = "Expiring at midnight of 2022-12-31"
          expression  = "request.time < timestamp(\"2023-01-01T00:00:00Z\")"
        }
      ]
    }
    "projects/cdg-gcp-playground/roles/custom_role_team_system_test" = {
      members = ["user:thai@fossil.com"]
      condition = [
        {
          title       = "expires_after_2022_12_31"
          description = "Expiring at midnight of 2022-12-31"
          expression  = "request.time < timestamp(\"2023-01-01T00:00:00Z\")"
        }
      ]
    }
  }
}

# IAM User by Roles
module "iam_user_by_roles_examples" {
  source   = "../"
  for_each = var.roles

  project   = "cdg-gcp-playground"
  role      = each.key
  members   = each.value.members
  condition = each.value.condition
}