# variables.tf - Variables para módulo EKS

variable "cluster_name" {
  description = "Nombre del clúster EKS"
  type        = string
}

variable "cluster_version" {
  description = "Versión de Kubernetes para el clúster"
  type        = string
}

variable "vpc_id" {
  description = "ID de la VPC asociada"
  type        = string
}

variable "subnet_ids" {
  description = "IDs de subnets donde correrán los nodos"
  type        = list(string)
}

variable "environment" {
  description = "Ambiente de despliegue (e.g., dev, prod)"
  type        = string
}