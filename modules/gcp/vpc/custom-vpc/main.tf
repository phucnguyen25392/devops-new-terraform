resource "google_compute_network" "this" {
  name                            = var.network_name
  project                         = var.project_id
  description                     = var.description
  routing_mode                    = var.routing_mode
  auto_create_subnetworks         = var.auto_create_subnetworks
  delete_default_routes_on_create = var.delete_default_routes_on_create
}

resource "google_compute_subnetwork" "this" {
  for_each = { for x in var.subnets : "${x.region}/${x.name}" => x }

  name                     = each.value.name
  ip_cidr_range            = each.value.ip_cidr_range
  region                   = each.value.region
  network                  = google_compute_network.this.id
  project                  = var.project_id
  description              = lookup(each.value, "description", null)
  private_ip_google_access = lookup(each.value, "private_ip_google_access", true)

  dynamic "secondary_ip_range" {
    for_each = each.value.secondary_ip_range != null ? each.value.secondary_ip_range : []
    content {
      range_name    = secondary_ip_range.value.range_name
      ip_cidr_range = secondary_ip_range.value.ip_cidr_range
    }
  }

  dynamic "log_config" {
    for_each = each.value.log_config != null ? [each.value.log_config] : []
    content {
      aggregation_interval = log_config.value.aggregation_interval
      flow_sampling        = log_config.value.flow_sampling
      metadata             = log_config.value.metadata
    }
  }
}
