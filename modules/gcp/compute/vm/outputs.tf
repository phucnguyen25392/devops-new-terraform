output "instance_name" {
  description = "The name of the VM instance."
  value       = google_compute_instance.this.name
}

output "instance_id" {
  description = "The server-assigned unique identifier of this resource."
  value       = google_compute_instance.this.instance_id
}

output "self_link" {
  description = "The URI of the created resource."
  value       = google_compute_instance.this.self_link
}

output "private_ip" {
  description = "The internal IP address of the instance."
  value       = google_compute_instance.this.network_interface[0].network_ip
}

output "public_ip" {
  description = "The external IP address of the instance, if applicable."
  value       = length(google_compute_instance.this.network_interface[0].access_config) > 0 ? google_compute_instance.this.network_interface[0].access_config[0].nat_ip : null
}
