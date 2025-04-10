
output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "transit_gateway_id" {
  description = "Transit Gateway ID"
  value       = module.transit_gateway.transit_gateway_id
}
