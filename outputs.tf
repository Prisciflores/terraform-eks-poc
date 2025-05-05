# outputs.tf - Salidas del módulo EKS

output "cluster_id" {
  description = "ID del clúster EKS"
  value       = module.eks.cluster_id
}

output "cluster_endpoint" {
  description = "Endpoint de la API del clúster"
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "ID del Security Group del clúster"
  value       = module.eks.cluster_security_group_id
}

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