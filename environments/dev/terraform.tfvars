# terraform.tfvars - Valores para entorno dev

aws_region      = "us-east-1"             # Región AWS (free tier disponible)
environment     = "dev"                  # Etiqueta de ambiente

# Valores VPC
vpc_name        = "dev-vpc"              # Nombre de la VPC
vpc_cidr        = "10.0.0.0/16"          # CIDR de la VPC
azs             = ["us-east-1a","us-east-1b"]  # Zonas disponibles
private_subnets = ["10.0.1.0/24","10.0.2.0/24"] # Subnets privadas
public_subnets  = ["10.0.101.0/24","10.0.102.0/24"] # Subnets públicas

# Valores EKS
cluster_name    = "dev-eks"               # Nombre del clúster EKS
cluster_version = "1.30"                  # Versión Kubernetes del clúster EKS