# variables.tf - Variables para módulo VPC

variable "vpc_name" {
  description = "Nombre de la VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR de la VPC"
  type        = string
}

variable "azs" {
  description = "Lista de zonas de disponibilidad"
  type        = list(string)
}

variable "private_subnets" {
  description = "CIDRs para subnets privadas"
  type        = list(string)
}

variable "public_subnets" {
  description = "CIDRs para subnets públicas"
  type        = list(string)
}

variable "environment" {
  description = "Ambiente de despliegue (e.g., dev, prod)"
  type        = string
}