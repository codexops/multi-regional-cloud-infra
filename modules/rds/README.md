# rds

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_appautoscaling_policy.rds_aurora](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_target.rds_aurora](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_target) | resource |
| [aws_db_parameter_group.db_parameter_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_parameter_group) | resource |
| [aws_db_subnet_group.subnet_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_kms_key.key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_rds_cluster.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster) | resource |
| [aws_rds_cluster_instance.cluster_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster_instance) | resource |
| [aws_rds_cluster_parameter_group.cluster_parameter_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster_parameter_group) | resource |
| [aws_security_group.rds_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.rds_egress_rules](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.rds_ingress_rules](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.rds_ingress_rules_rds](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group.node_group_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/security_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_appautoscaling_metric_type"></a> [appautoscaling\_metric\_type](#input\_appautoscaling\_metric\_type) | The metric type to scale on. Valid values are `RDSReaderAverageCPUUtilization` and `RDSReaderAverageDatabaseConnections` | `string` | `"RDSReaderAverageCPUUtilization"` | no |
| <a name="input_appautoscaling_policy_name"></a> [appautoscaling\_policy\_name](#input\_appautoscaling\_policy\_name) | Autoscaling policy name | `string` | `"cpu-auto-scaling"` | no |
| <a name="input_appautoscaling_target_value"></a> [appautoscaling\_target\_value](#input\_appautoscaling\_target\_value) | CPU threshold which will initiate autoscaling | `number` | `70` | no |
| <a name="input_cluster_backup_retention_period"></a> [cluster\_backup\_retention\_period](#input\_cluster\_backup\_retention\_period) | The days to retain backups for. | `number` | `1` | no |
| <a name="input_cluster_database_name"></a> [cluster\_database\_name](#input\_cluster\_database\_name) | Name for an automatically created database on cluster creation | `string` | `"testdatabase"` | no |
| <a name="input_cluster_deletion_protection"></a> [cluster\_deletion\_protection](#input\_cluster\_deletion\_protection) | If the DB instance should have deletion protection enabled. The database can't be deleted when this value is set to `true`. The default is `false` | `bool` | `false` | no |
| <a name="input_cluster_engine"></a> [cluster\_engine](#input\_cluster\_engine) | The name of the database engine to be used for this DB cluster. | `string` | `"aurora-mysql"` | no |
| <a name="input_cluster_engine_version"></a> [cluster\_engine\_version](#input\_cluster\_engine\_version) | The database engine version. | `string` | `"5.7.mysql_aurora.2.11.2"` | no |
| <a name="input_cluster_family"></a> [cluster\_family](#input\_cluster\_family) | The family of the DB cluster parameter group | `string` | `"aurora-mysql5.7"` | no |
| <a name="input_cluster_instance_auto_minor_version_upgrade"></a> [cluster\_instance\_auto\_minor\_version\_upgrade](#input\_cluster\_instance\_auto\_minor\_version\_upgrade) | Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window. Default `true` | `bool` | `true` | no |
| <a name="input_cluster_instance_class"></a> [cluster\_instance\_class](#input\_cluster\_instance\_class) | Instance type to use at master instance. Note: if `autoscaling_enabled` is `true`, this will be the same instance class used on instances created by autoscaling | `string` | `"db.r5.large"` | no |
| <a name="input_cluster_instance_count"></a> [cluster\_instance\_count](#input\_cluster\_instance\_count) | count of instance in cluster | `number` | `2` | no |
| <a name="input_cluster_instance_monitoring_interval"></a> [cluster\_instance\_monitoring\_interval](#input\_cluster\_instance\_monitoring\_interval) | The interval, in seconds, between points when Enhanced Monitoring metrics are collected for instances. | `number` | `60` | no |
| <a name="input_cluster_instance_name"></a> [cluster\_instance\_name](#input\_cluster\_instance\_name) | Name of cluster instances | `string` | `"db-cluster-1-instance"` | no |
| <a name="input_cluster_instance_performance_insights_enabled"></a> [cluster\_instance\_performance\_insights\_enabled](#input\_cluster\_instance\_performance\_insights\_enabled) | Specifies whether Performance Insights is enabled or not | `bool` | `true` | no |
| <a name="input_cluster_instance_performance_insights_retention_period"></a> [cluster\_instance\_performance\_insights\_retention\_period](#input\_cluster\_instance\_performance\_insights\_retention\_period) | Amount of time in days to retain Performance Insights data. | `number` | `7` | no |
| <a name="input_cluster_instance_publicly_accessible"></a> [cluster\_instance\_publicly\_accessible](#input\_cluster\_instance\_publicly\_accessible) | Determines whether instances are publicly accessible. Default `false` | `bool` | `false` | no |
| <a name="input_cluster_master_password"></a> [cluster\_master\_password](#input\_cluster\_master\_password) | Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file. Required unless `manage_master_user_password` is set to `true` or unless `snapshot_identifier` or `replication_source_identifier` is provided or unless a `global_cluster_identifier` is provided when the cluster is the secondary cluster of a global database | `string` | `null` | no |
| <a name="input_cluster_master_username"></a> [cluster\_master\_username](#input\_cluster\_master\_username) | Username for the master DB user. Required unless `manage_master_user_password` is set to `true` or unless `snapshot_identifier` or `replication_source_identifier` is provided or unless a `global_cluster_identifier` is provided when the cluster is the secondary cluster of a global database | `string` | `null` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the RDS Cluster. | `string` | `"db-cluster-1"` | no |
| <a name="input_cluster_parameter_group_name"></a> [cluster\_parameter\_group\_name](#input\_cluster\_parameter\_group\_name) | The name of the cluster parameter group | `string` | `"cluster-parameter-group1-mysql5-7"` | no |
| <a name="input_cluster_port"></a> [cluster\_port](#input\_cluster\_port) | The port on which the DB accepts connections | `string` | `null` | no |
| <a name="input_cluster_preferred_backup_window"></a> [cluster\_preferred\_backup\_window](#input\_cluster\_preferred\_backup\_window) | The daily time range during which automated backups are created if automated backups are enabled using the `backup_retention_period` parameter. Time in UTC | `string` | `"02:00-03:00"` | no |
| <a name="input_cluster_preferred_maintenance_window"></a> [cluster\_preferred\_maintenance\_window](#input\_cluster\_preferred\_maintenance\_window) | The weekly time range during which system maintenance can occur, in (UTC) | `string` | `"sun:05:00-sun:06:00"` | no |
| <a name="input_cluster_skip_final_snapshot"></a> [cluster\_skip\_final\_snapshot](#input\_cluster\_skip\_final\_snapshot) | Determines whether a final snapshot is created before the cluster is deleted. If true is specified, no snapshot is created | `bool` | `true` | no |
| <a name="input_cluster_storage_encrypted"></a> [cluster\_storage\_encrypted](#input\_cluster\_storage\_encrypted) | Specifies whether the DB cluster is encrypted. The default is `true` | `bool` | `true` | no |
| <a name="input_db_parameter_group_name"></a> [db\_parameter\_group\_name](#input\_db\_parameter\_group\_name) | The name of the DB parameter group | `string` | `"db-parameter-group1-mysql5-7"` | no |
| <a name="input_db_subnet_group_name"></a> [db\_subnet\_group\_name](#input\_db\_subnet\_group\_name) | The name of the subnet group name. | `string` | `"db-subnet-group-west1"` | no |
| <a name="input_db_subnet_group_tag_name"></a> [db\_subnet\_group\_tag\_name](#input\_db\_subnet\_group\_tag\_name) | Tag of the subnet group. | `string` | `"RDS MySQL DB subnet group"` | no |
| <a name="input_eks_cluster_name"></a> [eks\_cluster\_name](#input\_eks\_cluster\_name) | EKS Cluster name for add rules in security group for access RDS. | `string` | `null` | no |
| <a name="input_global_cluster_id"></a> [global\_cluster\_id](#input\_global\_cluster\_id) | The global cluster identifier specified on `aws_rds_global_cluster` | `string` | `null` | no |
| <a name="input_ingress_rule_database_port"></a> [ingress\_rule\_database\_port](#input\_ingress\_rule\_database\_port) | Ingress rule port for RDS cluster. | `number` | `3306` | no |
| <a name="input_ingress_rule_port_protocol"></a> [ingress\_rule\_port\_protocol](#input\_ingress\_rule\_port\_protocol) | Ingress rule protocol for RDS cluster. | `string` | `"tcp"` | no |
| <a name="input_is_primary_cluster"></a> [is\_primary\_cluster](#input\_is\_primary\_cluster) | Determines whether cluster is primary cluster with writer instance (set to `false` for global cluster and replica clusters) | `bool` | `true` | no |
| <a name="input_rds_egress_cidr_blocks"></a> [rds\_egress\_cidr\_blocks](#input\_rds\_egress\_cidr\_blocks) | Egress CIDR Blocks of security group for RDS. | `list(any)` | `[]` | no |
| <a name="input_rds_egress_rules"></a> [rds\_egress\_rules](#input\_rds\_egress\_rules) | Egress rules of security group for RDS. | `list(any)` | <pre>[<br>  0<br>]</pre> | no |
| <a name="input_rds_egress_rules_from_port"></a> [rds\_egress\_rules\_from\_port](#input\_rds\_egress\_rules\_from\_port) | Egress rules from port of security group for RDS. | `list(any)` | <pre>[<br>  0<br>]</pre> | no |
| <a name="input_rds_egress_rules_protocols"></a> [rds\_egress\_rules\_protocols](#input\_rds\_egress\_rules\_protocols) | Egress rules protocols of security group for RDS. | `list(any)` | <pre>[<br>  "-1"<br>]</pre> | no |
| <a name="input_rds_egress_rules_to_port"></a> [rds\_egress\_rules\_to\_port](#input\_rds\_egress\_rules\_to\_port) | Egress rules to port of security group for RDS. | `list(any)` | <pre>[<br>  0<br>]</pre> | no |
| <a name="input_rds_ingress_cidr_blocks"></a> [rds\_ingress\_cidr\_blocks](#input\_rds\_ingress\_cidr\_blocks) | Ingress CIDR Blocks of security group for RDS. | `list(any)` | `[]` | no |
| <a name="input_rds_ingress_rules"></a> [rds\_ingress\_rules](#input\_rds\_ingress\_rules) | Ingress rules of security group for RDS. | `list(any)` | <pre>[<br>  3306<br>]</pre> | no |
| <a name="input_rds_ingress_rules_from_port"></a> [rds\_ingress\_rules\_from\_port](#input\_rds\_ingress\_rules\_from\_port) | Ingress rules from port of security group for RDS. | `list(any)` | <pre>[<br>  3306<br>]</pre> | no |
| <a name="input_rds_ingress_rules_protocols"></a> [rds\_ingress\_rules\_protocols](#input\_rds\_ingress\_rules\_protocols) | Ingress rules protocols of security group for RDS. | `list(any)` | <pre>[<br>  "tcp"<br>]</pre> | no |
| <a name="input_rds_ingress_rules_to_port"></a> [rds\_ingress\_rules\_to\_port](#input\_rds\_ingress\_rules\_to\_port) | Ingress rules to port of security group for RDS. | `list(any)` | <pre>[<br>  3306<br>]</pre> | no |
| <a name="input_rds_instance_max_capacity"></a> [rds\_instance\_max\_capacity](#input\_rds\_instance\_max\_capacity) | Maximum number of read replicas permitted when autoscaling is enabled | `number` | `15` | no |
| <a name="input_rds_instance_min_capacity"></a> [rds\_instance\_min\_capacity](#input\_rds\_instance\_min\_capacity) | Minimum number of read replicas permitted when autoscaling is enabled | `number` | `1` | no |
| <a name="input_rds_monitoring_role"></a> [rds\_monitoring\_role](#input\_rds\_monitoring\_role) | IAM role used by RDS to send enhanced monitoring metrics to CloudWatch | `string` | `""` | no |
| <a name="input_rds_security_group_name"></a> [rds\_security\_group\_name](#input\_rds\_security\_group\_name) | Name of security group for RDS. | `string` | `"aurora-sg"` | no |
| <a name="input_rds_security_group_tag_name"></a> [rds\_security\_group\_tag\_name](#input\_rds\_security\_group\_tag\_name) | Tag of security group for RDS. | `string` | `"rds test security group"` | no |
| <a name="input_rds_service_role"></a> [rds\_service\_role](#input\_rds\_service\_role) | IAM role used by RDS. | `string` | `""` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of subnet IDs used by database subnet group created | `list(string)` | `[]` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID of the VPC where to create security group | `string` | `""` | no |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
