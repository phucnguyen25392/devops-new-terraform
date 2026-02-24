provider "google" {
  project = "cdg-gcp-playground"
}

data "google_iam_policy" "examples" {
  binding {
    role = "roles/iam.serviceAccountUser"

    members = [
      "user:tvhop@fossil.com",
      "user:hdnguyen@fossil.com"
    ]
  }
}

variable "service_accounts" {
  type = any
  default = {
    team-system-test = {
      display_name = "Team System Terraform"
      description  = "[Test] Terraform"
      roles        = ["roles/iam.serviceAccountUser"]
      members = [
        "user:tvhop@fossil.com",
        "user:hdnguyen@fossil.com"
      ]
      condition = [
        {
          title       = "expires_after_2022_12_31"
          description = "Expiring at midnight of 2022-12-31"
          expression  = "request.time < timestamp(\"2023-01-01T00:00:00Z\")"
        }
      ]
      policies = [data.google_iam_policy.examples.policy_data]
      keys = [
        {
          key_algorithm = "KEY_ALG_RSA_2048"
          rotation_days = 30
        }
      ]
    }
  }
}

# Service Account
module "service_accounts_examples" {
  source   = "../"
  for_each = var.service_accounts

  account_id   = each.key
  display_name = each.value.display_name
  description  = each.value.description

  roles     = lookup(each.value, "roles", [])
  members   = lookup(each.value, "members", [])
  condition = lookup(each.value, "condition", null)
  policies  = lookup(each.value, "policies", [])
  keys      = lookup(each.value, "keys", [])
}