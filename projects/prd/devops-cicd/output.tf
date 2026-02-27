output "instance_id" {
  description = "The server-assigned unique identifier of this resource."
  value = {
    for k, v in module.vm : k => v.instance_id
  }
}
