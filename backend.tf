terraform {
  backend "s3" {
    bucket       = "mi-terraform-state-bucket"      # Reemplázalo por el bucket real en us-east-1
    key          = "terraform/eks/dev.tfstate"       # Ruta dentro del bucket
    region       = "us-east-1"                       # Región donde vas a trabajar y desplegar
    use_lockfile = true                              # Activa bloqueo local
    encrypt      = true                              # Cifrado activado
  }
}
