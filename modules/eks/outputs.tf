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