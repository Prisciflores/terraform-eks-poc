# variables.tf - Variables para entorno dev

variable "aws_region" {
  description = "Región AWS donde se desplegará la infraestructura"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Entorno de despliegue (e.g., dev, prod)"
  type        = string
  default     = "dev"
}

# Variables para VPC
variable "vpc_name" {
  description = "Nombre de la VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR de la VPC"
  type        = string
}

variable "azs" {
  description = "Zonas de disponibilidad"
  type        = list(string)
}

variable "private_subnets" {
  description = "CIDRs de las subnets privadas"
  type        = list(string)
}

variable "public_subnets" {
  description = "CIDRs de las subnets públicas"
  type        = list(string)
}

# Variables para EKS
variable "cluster_name" {
  description = "Nombre del clúster EKS"
  type        = string
}

variable "cluster_version" {
  description = "Versión Kubernetes del EKS"
  type        = string
}