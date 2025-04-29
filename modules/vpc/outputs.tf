# outputs.tf - Salidas del módulo VPC

output "vpc_id" {
  description = "ID de la VPC creada"
  value       = module.vpc.vpc_id
}

output "private_subnets" {
  description = "IDs de subnets privadas"
  value       = module.vpc.private_subnets
}

output "public_subnets" {
  description = "IDs de subnets públicas"
  value       = module.vpc.public_subnets
}