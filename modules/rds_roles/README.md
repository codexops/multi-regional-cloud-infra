# rds_roles

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.load_balancer_controller_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.eks_cluster_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.eks_node_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.rds_monitoring_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_policy.ec2_container_registry_read_only_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy.eks_cluster_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy.eks_cni_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy.eks_worker_node_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy.rds_monitoring_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_policy.rds_service_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_role.rds_service_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_role) | data source |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_eks_cluster_role"></a> [eks\_cluster\_role](#output\_eks\_cluster\_role) | n/a |
| <a name="output_eks_node_role"></a> [eks\_node\_role](#output\_eks\_node\_role) | n/a |
| <a name="output_rds_monitoring_role"></a> [rds\_monitoring\_role](#output\_rds\_monitoring\_role) | n/a |
| <a name="output_rds_service_role"></a> [rds\_service\_role](#output\_rds\_service\_role) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
