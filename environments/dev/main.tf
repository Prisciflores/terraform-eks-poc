# Invoca los módulos VPC y EKS en entorno DEV

# Configura el proveedor AWS y la región (free tier disponible en us-east-1)
provider "aws" {
  region = var.aws_region    # Se usa la región us-east-1 por defecto
}

# Módulo VPC
module "vpc" {
  source          = "../../modules/vpc"   # Ruta al módulo VPC
  vpc_name        = var.vpc_name           # Nombre de la VPC (ej: dev-vpc)
  vpc_cidr        = var.vpc_cidr           # CIDR de la VPC (ej: 10.0.0.0/16)
  azs             = var.azs               # Zonas de disponibilidad
  private_subnets = var.private_subnets    # CIDRs subnets privadas
  public_subnets  = var.public_subnets     # CIDRs subnets públicas
  environment     = var.environment        # Etiqueta de ambiente (ej: dev)
}

# Módulo EKS
module "eks" {
  source          = "../../modules/eks"   # Ruta al módulo EKS
  cluster_name    = var.cluster_name        # Nombre del clúster (ej: dev-eks)
  cluster_version = var.cluster_version     # Versión Kubernetes: 1.30
  vpc_id          = module.vpc.vpc_id      # ID de la VPC creada
  subnet_ids      = module.vpc.private_subnets  # Subnets privadas para los nodos
  environment     = var.environment         # Ambiente de despliegue
}