# main.tf - Crea un clúster EKS con node groups gestionados

module "eks" {
  source  = "terraform-aws-modules/eks/aws"  # fuente del módulo EKS oficial
  version = "~> 20.12"                       # versión del módulo

  cluster_name    = var.cluster_name         # nombre del clúster
  cluster_version = var.cluster_version      # versión de Kubernetes (1.30)

  vpc_id     = var.vpc_id                    # ID de la VPC existente
  subnet_ids = var.subnet_ids                # IDs de subnets para EKS

  eks_managed_node_groups = {
    default = {                              # node group por defecto
      instance_types = ["t3.medium"]         # tipo de instancia EC2
      desired_size   = 2                       # número deseado de nodos
      min_size       = 1                       # tamaño mínimo
      max_size       = 3                       # tamaño máximo
    }
  }

  manage_aws_auth_configmap = true           # gestiona aws-auth ConfigMap

  tags = {
    Environment = var.environment             # etiqueta de ambiente
    Terraform   = "true"
  }
}