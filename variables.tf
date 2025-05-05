# variables.tf - Variables para módulo EKS

variable "cluster_name" {
  description = "Nombre del clúster EKS"
  type        = string
  default     = "eks-poc" # Cambia esto por el nombre deseado
}

variable "cluster_version" {
  description = "Versión de Kubernetes para el clúster"
  type        = string
  default     = "1.30" # Cambia esto por la versión deseada
}

# variables.tf - Variables para módulo VPC

variable "vpc_name" {
  description = "Nombre de la VPC"
  type        = string
  default     = "vpc-poc" # Cambia esto por el nombre deseado
}

variable "vpc_cidr" {
  description = "CIDR de la VPC"
  type        = string
  default     = "10.0.0.0/16" # Cambia esto por el CIDR deseado
}

variable "azs" {
  description = "Lista de zonas de disponibilidad"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"] # Cambia esto por las AZs deseadas
}

variable "private_subnets" {
  description = "CIDRs para subnets privadas"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"] # Cambia esto por los CIDRs deseados
}

variable "public_subnets" {
  description = "CIDRs para subnets públicas"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"] # Cambia esto por los CIDRs deseados
}

variable "environment" {
  description = "Ambiente de despliegue (e.g., dev, prod)"
  type        = string
  default     = "dev" # Cambia esto por el ambiente deseado
}