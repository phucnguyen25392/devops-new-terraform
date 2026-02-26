output "vpc_id" {
  value = module.vpc.network_id
}

output "vpc_name" {
  value = module.vpc.network_name
}

output "vpc_self_link" {
  value = module.vpc.network_self_link
}

output "subnets" {
  value = module.vpc.subnets
}
