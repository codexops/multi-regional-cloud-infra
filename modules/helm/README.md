# helm

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.9.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | 1.14.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.19.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.9.0 |
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | 1.14.0 |

## Resources

| Name | Type |
|------|------|
| [helm_release.aws_load_balancer_controller](https://registry.terraform.io/providers/hashicorp/helm/2.9.0/docs/resources/release) | resource |
| [kubectl_manifest.load_balancer_service_account](https://registry.terraform.io/providers/gavinbunney/kubectl/1.14.0/docs/resources/manifest) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_eks_cluster_name"></a> [eks\_cluster\_name](#input\_eks\_cluster\_name) | Name of EKS Cluster | `string` | `null` | no |
| <a name="input_load_balancer_controller_role_arn"></a> [load\_balancer\_controller\_role\_arn](#input\_load\_balancer\_controller\_role\_arn) | Load balancer controller role arn. | `string` | `""` | no |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
