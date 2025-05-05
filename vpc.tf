# main.tf - Crea una VPC con subnets públicas y privadas usando el módulo oficial aws
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws" # fuente del módulo VPC oficial
  version = "~> 5.8"                        # versión del módulo

  name = var.vpc_name # nombre de la VPC
  cidr = var.vpc_cidr # rango CIDR de la VPC

  azs             = var.azs             # zonas de disponibilidad
  private_subnets = var.private_subnets # CIDRs de subnets privadas
  public_subnets  = var.public_subnets  # CIDRs de subnets públicas

  enable_nat_gateway = true # habilita NAT Gateway para subnets privadas
  single_nat_gateway = true # un solo NAT Gateway para ahorro de costos

  tags = {
    Environment = var.environment # etiqueta de ambiente
    Terraform   = "true"
  }
}