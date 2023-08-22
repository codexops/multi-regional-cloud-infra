# global_rds
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_rds_global_cluster.global_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_global_cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_global_cluster_database_name"></a> [global\_cluster\_database\_name](#input\_global\_cluster\_database\_name) | Database name of global cluster. | `string` | `"testdatabase"` | no |
| <a name="input_global_cluster_deletion_protection"></a> [global\_cluster\_deletion\_protection](#input\_global\_cluster\_deletion\_protection) | Deletion protection of global cluster. | `bool` | `false` | no |
| <a name="input_global_cluster_engine"></a> [global\_cluster\_engine](#input\_global\_cluster\_engine) | Name of global cluster engine or database type. | `string` | `"aurora-mysql"` | no |
| <a name="input_global_cluster_engine_version"></a> [global\_cluster\_engine\_version](#input\_global\_cluster\_engine\_version) | Version of global cluster engine or database. | `string` | `"5.7.mysql_aurora.2.11.2"` | no |
| <a name="input_global_cluster_name"></a> [global\_cluster\_name](#input\_global\_cluster\_name) | Name of global cluster of Aurora MySQL. | `string` | `"global-cluster-1"` | no |
| <a name="input_global_cluster_storage_encrypted"></a> [global\_cluster\_storage\_encrypted](#input\_global\_cluster\_storage\_encrypted) | Storage needs to be encrypted or not of global cluster. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_global_cluster_database_name"></a> [global\_cluster\_database\_name](#output\_global\_cluster\_database\_name) | n/a |
| <a name="output_global_cluster_engine"></a> [global\_cluster\_engine](#output\_global\_cluster\_engine) | n/a |
| <a name="output_global_cluster_engine_version"></a> [global\_cluster\_engine\_version](#output\_global\_cluster\_engine\_version) | n/a |
| <a name="output_global_cluster_id"></a> [global\_cluster\_id](#output\_global\_cluster\_id) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
