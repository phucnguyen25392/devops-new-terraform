resource "google_service_account" "this" {
  account_id   = var.account_id
  display_name = var.display_name
  description  = var.description
  disabled     = var.disabled
}

resource "google_service_account_iam_binding" "this" {
  service_account_id = google_service_account.this.id
  for_each           = toset(var.roles)

  role    = each.value
  members = var.members

  dynamic "condition" {
    for_each = var.condition
    content {
      title       = condition.value.title
      description = condition.value.description
      expression  = condition.value.expression
    }
  }
}

resource "google_service_account_key" "this" {
  service_account_id = google_service_account.this.id
  for_each           = { for index, key in var.keys : index => key }

  key_algorithm    = lookup(each.value, "key_algorithm", "KEY_ALG_RSA_2048")
  public_key_type  = lookup(each.value, "public_key_type", "TYPE_X509_PEM_FILE")
  private_key_type = lookup(each.value, "private_key_type", "TYPE_GOOGLE_CREDENTIALS_FILE")

  keepers = {
    rotation_days = lookup(each.value, "rotation_days", 30)
  }
}

resource "google_service_account_iam_policy" "this" {
  service_account_id = google_service_account.this.id
  for_each           = toset(var.policies)

  policy_data = each.value
}