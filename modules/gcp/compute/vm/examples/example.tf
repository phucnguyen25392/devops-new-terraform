module "vm_example" {
  source = "../"

  project_id = "my-project-id"
  name       = "example-instance"
  zone       = "us-central1-a"

  machine_type = "n1-standard-1"
  tags         = ["web", "production"]

  boot_disk_image = "debian-cloud/debian-11"
  boot_disk_size  = 30

  network    = "default"
  subnetwork = "default"

  labels = {
    environment = "dev"
    managed_by  = "terraform"
  }

  metadata = {
    foo = "bar"
  }
}

output "instance_name" {
  value = module.vm_example.instance_name
}

output "instance_ip" {
  value = module.vm_example.private_ip
}
