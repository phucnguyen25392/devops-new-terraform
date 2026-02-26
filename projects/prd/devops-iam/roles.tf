provider "google" {
  project = "phuc-devops"
}

variable "roles" {
  type = any
  default = {
    "roles/iam.serviceAccountUser" = {
      members = ["user:hellboy.1315@gmail.com"]
      condition = [
        {
          title       = "expires_after_2022_12_31"
          description = "Expiring at midnight of 2022-12-31"
          expression  = "request.time < timestamp(\"2027-01-01T00:00:00Z\")"
        }
      ]
    }
  }
}
module "role" {
  source   = "../../../modules/gcp/iam/user-by-roles"
  for_each = var.roles

  project   = "phuc-devops"
  role      = each.key
  members   = each.value.members
  condition = each.value.condition
}
