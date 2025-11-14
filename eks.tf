# main.tf - Crea un clúster EKS con node groups gestionados

module "eks" {
  source  = "terraform-aws-modules/eks/aws" # fuente del módulo EKS oficial
  version = "~> 20.12"                      # versión del módulo

  cluster_name    = var.cluster_name    # nombre del clúster
  cluster_version = var.cluster_version # versión de Kubernetes (1.30)

  vpc_id     = module.vpc.vpc_id          # ID de la VPC existente
  subnet_ids = module.vpc.private_subnets # IDs de subnets para EKS

  # Optional
  cluster_endpoint_public_access       = true
  cluster_endpoint_public_access_cidrs = ["186.67.243.223/32"] # IP pública de tu máquina local


  eks_managed_node_groups = {
    default = {                     # node group por defecto
      instance_types = ["t2.micro"] # tipo de instancia EC2 (free tier elegible)
      desired_size   = 3            # número deseado de nodos
      min_size       = 1            # tamaño mínimo
      max_size       = 3            # tamaño máximo
    }
  }

  #manage_aws_auth_configmap = true # gestiona aws-auth ConfigMap

  tags = {
    Environment = var.environment # etiqueta de ambiente
    Terraform   = "true"
  }
  depends_on = [module.vpc] # depende del módulo VPC
}