# k8s

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.19.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.19.0 |

## Resources

| Name | Type |
|------|------|
| [kubernetes_deployment.deployment](https://registry.terraform.io/providers/hashicorp/kubernetes/2.19.0/docs/resources/deployment) | resource |
| [kubernetes_ingress_v1.ingress](https://registry.terraform.io/providers/hashicorp/kubernetes/2.19.0/docs/resources/ingress_v1) | resource |
| [kubernetes_namespace.namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/2.19.0/docs/resources/namespace) | resource |
| [kubernetes_service.service](https://registry.terraform.io/providers/hashicorp/kubernetes/2.19.0/docs/resources/service) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_deployment_container_image"></a> [deployment\_container\_image](#input\_deployment\_container\_image) | Deployment container image in EKS Cluster | `string` | `"public.ecr.aws/l6m2t8p7/docker-2048:latest"` | no |
| <a name="input_deployment_container_name"></a> [deployment\_container\_name](#input\_deployment\_container\_name) | Deployment container name in EKS Cluster | `string` | `"app-2048"` | no |
| <a name="input_deployment_container_port"></a> [deployment\_container\_port](#input\_deployment\_container\_port) | Deployment container port in EKS Cluster | `number` | `80` | no |
| <a name="input_deployment_container_protocol"></a> [deployment\_container\_protocol](#input\_deployment\_container\_protocol) | Deployment container protocol in EKS Cluster | `string` | `"TCP"` | no |
| <a name="input_deployment_matchlabels"></a> [deployment\_matchlabels](#input\_deployment\_matchlabels) | Deployment matchlabels in EKS Cluster | `string` | `"app-2048"` | no |
| <a name="input_deployment_name"></a> [deployment\_name](#input\_deployment\_name) | Deployment Name in EKS Cluster | `string` | `"deployment-2048"` | no |
| <a name="input_deployment_replicas"></a> [deployment\_replicas](#input\_deployment\_replicas) | Deployment replicas in EKS Cluster | `number` | `5` | no |
| <a name="input_ingress_load_balancer_name"></a> [ingress\_load\_balancer\_name](#input\_ingress\_load\_balancer\_name) | Ingress load balancer name in EKS Cluster | `string` | `"test-alb"` | no |
| <a name="input_ingress_name"></a> [ingress\_name](#input\_ingress\_name) | Ingress name in EKS Cluster | `string` | `"ingress-2048"` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace in EKS Cluster | `string` | `"game-20481"` | no |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | Service name in EKS Cluster | `string` | `"service-2048"` | no |
| <a name="input_service_port"></a> [service\_port](#input\_service\_port) | Service port in EKS Cluster | `number` | `80` | no |
| <a name="input_service_protocol"></a> [service\_protocol](#input\_service\_protocol) | Service protocol in EKS Cluster | `string` | `"TCP"` | no |
| <a name="input_service_type"></a> [service\_type](#input\_service\_type) | Service type in EKS Cluster | `string` | `"NodePort"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_load_balancer_hostname_name"></a> [load\_balancer\_hostname\_name](#output\_load\_balancer\_hostname\_name) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
