# terraform-eks-poc

Repositorio Terraform que crea una VPC y un clúster Amazon EKS (Elastic Kubernetes Service).

## Contenido del repositorio

Archivos principales:

- `backend.tf`    : configuración del backend de estado (ej. S3/DynamoDB) — revisar el archivo para detalles.
- `provider.tf`   : configuración del provider de AWS y versión.
- `variables.tf`  : variables de entrada del proyecto.
- `vpc.tf`        : recursos para crear la VPC (subnets, route tables, etc.).
- `eks.tf`        : definición del clúster EKS (control plane, node groups o node pools).
- `outputs.tf`    : salidas exportadas (revisar para nombres exactos).

> Nota: revisa cada archivo para confirmar nombres exactos de variables y salidas antes de pasar variables a la línea de comandos.

## Requisitos previos

- Terraform 1.x (u otra versión compatible con la configuración del repo).
- AWS CLI configurado con credenciales y región (perfil con permisos suficientes para crear VPC y EKS).
- `kubectl` para conectarte al clúster (opcional, pero recomendado).
- Acceso a una cuenta AWS con permisos para crear recursos: VPC, EC2, EKS, IAM, etc.

Si el `backend.tf` apunta a un backend remoto (S3/DynamoDB), asegúrate de tener permisos para leer/escribir el estado remoto.

## Contrato rápido (inputs/outputs)

- Inputs: variables definidas en `variables.tf` (p. ej. `region`, `cluster_name`, tamaños de subred, CIDR de VPC, tipos/numero de nodos).
- Outputs: los valores expuestos en `outputs.tf` (p. ej. nombre del clúster, ARN, endpoints o kubeconfig si están definidos).
- Error modes: fallos por permisos AWS, falta de cuotas, valores inválidos en variables.

Edge cases a considerar:

- Valores de variables vacíos o mal tipados.
- Recursos ya existentes con nombres/IDs que colisionan.
- Límites de servicio (EKS, ENI, direcciones IP) en la cuenta/región.

## Uso (comandos)

1) Inicializar Terraform y backend:

```bash
terraform init
```

2) Revisar plan (usa `-var` o `-var-file` según necesites):

```bash
terraform plan -var="cluster_name=mi-cluster" -var="region=us-east-1"
```

3) Aplicar la infraestructura:

```bash
terraform apply -var="cluster_name=mi-cluster" -var="region=us-east-1"
```

4) Obtener credenciales kubeconfig para `kubectl` (reemplaza `<cluster-name>` y `<region>` por tus valores):

```bash
aws eks update-kubeconfig --name <cluster-name> --region <region>
# luego verifica
kubectl get nodes
```

5) Destruir la infraestructura cuando ya no se necesite:

```bash
terraform destroy -var="cluster_name=mi-cluster" -var="region=us-east-1"
```

## Variables y backend

- Las variables por defecto y sus descripciones están en `variables.tf`. Revisa y, si es necesario, crea un archivo `terraform.tfvars` o usa `-var-file` para pasar valores en entornos distintos.
- `backend.tf` contiene la configuración del backend remoto (S3/DynamoDB u otro). Si el backend requiere recursos previos, configúralos antes de `terraform init` o utiliza un backend local temporal para pruebas.

## Salidas

Revisa `outputs.tf` para ver las salidas exactas que este proyecto expone. Habitualmente se incluyen cosas como el nombre del clúster, ARN, y a veces una sección para exportar un kubeconfig simplificado.

## Notas y supuestos

- Asumo que el proyecto se aplica con credenciales de AWS con permisos suficientes.
- No se ha agregado lógica específica de CI/CD en este repo; para integrarlo se puede añadir un pipeline (GitHub Actions, GitLab CI, etc.) que haga `terraform fmt`, `terraform init -backend-config`, `terraform plan` y `terraform apply` con controles de seguridad.
- Comprueba límites de servicio de EKS en tu cuenta antes de pedir muchas o grandes instancias.

## Siguientes pasos recomendados

- Añadir un `terraform.tfvars.example` con valores mínimos de ejemplo.
- Añadir validaciones y pruebas (terratest o `terraform validate` + unit tests).
- Documentar outputs exactos y variables con ejemplos concretos.

## Licencia

Licencia: revisa el repositorio para la licencia aplicable o añade un archivo `LICENSE` si aún no existe.

---

Si quieres, puedo:

- añadir un `terraform.tfvars.example` con valores recomendados,
- extraer y documentar las variables y outputs exactos leyendo `variables.tf` y `outputs.tf` para incluir sus nombres y ejemplos concretos en el README,
- o preparar un pequeño workflow de GitHub Actions para validar y aplicar el plan.

Indícame cuál de estas opciones prefieres.

