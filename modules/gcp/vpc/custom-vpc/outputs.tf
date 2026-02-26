output "network_name" {
  description = "The name of the VPC being created"
  value       = google_compute_network.this.name
}

output "network_id" {
  description = "The ID of the VPC being created"
  value       = google_compute_network.this.id
}

output "network_self_link" {
  description = "The URI of the VPC being created"
  value       = google_compute_network.this.self_link
}

output "subnets" {
  description = "The created subnetworks"
  value       = google_compute_subnetwork.this
}
