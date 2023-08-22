# prod

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.58.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.9.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | >= 1.7.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.19.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws.AWS_REGION_US_WEST_1"></a> [aws.AWS\_REGION\_US\_WEST\_1](#provider\_aws.AWS\_REGION\_US\_WEST\_1) | 4.58.0 |
| <a name="provider_aws.AWS_REGION_US_WEST_2"></a> [aws.AWS\_REGION\_US\_WEST\_2](#provider\_aws.AWS\_REGION\_US\_WEST\_2) | 4.58.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks1"></a> [eks1](#module\_eks1) | ../../modules/eks | n/a |
| <a name="module_eks2"></a> [eks2](#module\_eks2) | ../../modules/eks | n/a |
| <a name="module_global_rds"></a> [global\_rds](#module\_global\_rds) | ../../modules/global_rds | n/a |
| <a name="module_globalaccelerator"></a> [globalaccelerator](#module\_globalaccelerator) | ../../modules/global_accelerator | n/a |
| <a name="module_helm1"></a> [helm1](#module\_helm1) | ../../modules/helm | n/a |
| <a name="module_helm2"></a> [helm2](#module\_helm2) | ../../modules/helm | n/a |
| <a name="module_k8s1"></a> [k8s1](#module\_k8s1) | ../../modules/k8s | n/a |
| <a name="module_k8s2"></a> [k8s2](#module\_k8s2) | ../../modules/k8s | n/a |
| <a name="module_rds1"></a> [rds1](#module\_rds1) | ../../modules/rds | n/a |
| <a name="module_rds2"></a> [rds2](#module\_rds2) | ../../modules/rds | n/a |
| <a name="module_rds_roles"></a> [rds\_roles](#module\_rds\_roles) | ../../modules/rds_roles | n/a |
| <a name="module_vpc1"></a> [vpc1](#module\_vpc1) | ../../modules/vpc | n/a |
| <a name="module_vpc2"></a> [vpc2](#module\_vpc2) | ../../modules/vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_eks_cluster.eks_cluster_us_west_1](https://registry.terraform.io/providers/hashicorp/aws/4.58.0/docs/data-sources/eks_cluster) | data source |
| [aws_eks_cluster.eks_cluster_us_west_2](https://registry.terraform.io/providers/hashicorp/aws/4.58.0/docs/data-sources/eks_cluster) | data source |
| [aws_eks_cluster_auth.eks_cluster_us_west_1](https://registry.terraform.io/providers/hashicorp/aws/4.58.0/docs/data-sources/eks_cluster_auth) | data source |
| [aws_eks_cluster_auth.eks_cluster_us_west_2](https://registry.terraform.io/providers/hashicorp/aws/4.58.0/docs/data-sources/eks_cluster_auth) | data source |
| [aws_lb.load_balancer1](https://registry.terraform.io/providers/hashicorp/aws/4.58.0/docs/data-sources/lb) | data source |
| [aws_lb.load_balancer2](https://registry.terraform.io/providers/hashicorp/aws/4.58.0/docs/data-sources/lb) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_appautoscaling_metric_type"></a> [appautoscaling\_metric\_type](#input\_appautoscaling\_metric\_type) | The metric type to scale on. Valid values are `RDSReaderAverageCPUUtilization` and `RDSReaderAverageDatabaseConnections` | `string` | `"RDSReaderAverageCPUUtilization"` | no |
| <a name="input_appautoscaling_policy_name"></a> [appautoscaling\_policy\_name](#input\_appautoscaling\_policy\_name) | Autoscaling policy name | `string` | `"cpu-auto-scaling"` | no |
| <a name="input_appautoscaling_target_value"></a> [appautoscaling\_target\_value](#input\_appautoscaling\_target\_value) | CPU threshold which will initiate autoscaling | `number` | `70` | no |
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | A list of availability zones names in the region | `list(string)` | <pre>[<br>  "us-west-1a",<br>  "us-west-1c"<br>]</pre> | no |
| <a name="input_capacity_type"></a> [capacity\_type](#input\_capacity\_type) | Type of capacity associated with the EKS Node Group. Valid values: `ON_DEMAND`, `SPOT` | `string` | `"ON_DEMAND"` | no |
| <a name="input_cluster_backup_retention_period"></a> [cluster\_backup\_retention\_period](#input\_cluster\_backup\_retention\_period) | The days to retain backups for. | `number` | `1` | no |
| <a name="input_cluster_database_name"></a> [cluster\_database\_name](#input\_cluster\_database\_name) | Name for an automatically created database on cluster creation | `string` | `"testdatabase"` | no |
| <a name="input_cluster_deletion_protection"></a> [cluster\_deletion\_protection](#input\_cluster\_deletion\_protection) | If the DB instance should have deletion protection enabled. The database can't be deleted when this value is set to `true`. The default is `false` | `bool` | `false` | no |
| <a name="input_cluster_enabled_log_types"></a> [cluster\_enabled\_log\_types](#input\_cluster\_enabled\_log\_types) | A list of the desired control plane logs to enable. For more information, see Amazon EKS Control Plane Logging documentation (https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html) | `list(string)` | <pre>[<br>  "api",<br>  "audit",<br>  "authenticator",<br>  "controllerManager",<br>  "scheduler"<br>]</pre> | no |
| <a name="input_cluster_endpoint_private_access"></a> [cluster\_endpoint\_private\_access](#input\_cluster\_endpoint\_private\_access) | Indicates whether or not the Amazon EKS private API server endpoint is enabled | `bool` | `true` | no |
| <a name="input_cluster_endpoint_public_access"></a> [cluster\_endpoint\_public\_access](#input\_cluster\_endpoint\_public\_access) | Indicates whether or not the Amazon EKS public API server endpoint is enabled | `bool` | `false` | no |
| <a name="input_cluster_endpoint_public_access_cidrs"></a> [cluster\_endpoint\_public\_access\_cidrs](#input\_cluster\_endpoint\_public\_access\_cidrs) | List of CIDR blocks which can access the Amazon EKS public API server endpoint | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
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
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the RDS Cluster. | `string` | `"db-cluster-1"` | no |
| <a name="input_cluster_parameter_group_name"></a> [cluster\_parameter\_group\_name](#input\_cluster\_parameter\_group\_name) | The name of the cluster parameter group | `string` | `"cluster-parameter-group1-mysql5-7"` | no |
| <a name="input_cluster_preferred_backup_window"></a> [cluster\_preferred\_backup\_window](#input\_cluster\_preferred\_backup\_window) | The daily time range during which automated backups are created if automated backups are enabled using the `backup_retention_period` parameter. Time in UTC | `string` | `"02:00-03:00"` | no |
| <a name="input_cluster_preferred_maintenance_window"></a> [cluster\_preferred\_maintenance\_window](#input\_cluster\_preferred\_maintenance\_window) | The weekly time range during which system maintenance can occur, in (UTC) | `string` | `"sun:05:00-sun:06:00"` | no |
| <a name="input_cluster_service_ipv4_cidr"></a> [cluster\_service\_ipv4\_cidr](#input\_cluster\_service\_ipv4\_cidr) | The CIDR block to assign Kubernetes service IP addresses from. If you don't specify a block, Kubernetes assigns addresses from either the 10.100.0.0/16 or 172.20.0.0/16 CIDR blocks | `string` | `"192.168.0.0/16"` | no |
| <a name="input_cluster_skip_final_snapshot"></a> [cluster\_skip\_final\_snapshot](#input\_cluster\_skip\_final\_snapshot) | Determines whether a final snapshot is created before the cluster is deleted. If true is specified, no snapshot is created | `bool` | `true` | no |
| <a name="input_cluster_storage_encrypted"></a> [cluster\_storage\_encrypted](#input\_cluster\_storage\_encrypted) | Specifies whether the DB cluster is encrypted. The default is `true` | `bool` | `true` | no |
| <a name="input_db_parameter_group_name"></a> [db\_parameter\_group\_name](#input\_db\_parameter\_group\_name) | The name of the DB parameter group | `string` | `"db-parameter-group1-mysql5-7"` | no |
| <a name="input_db_subnet_group_name"></a> [db\_subnet\_group\_name](#input\_db\_subnet\_group\_name) | The name of the subnet group name. | `string` | `"db-subnet-group-west1"` | no |
| <a name="input_db_subnet_group_tag_name"></a> [db\_subnet\_group\_tag\_name](#input\_db\_subnet\_group\_tag\_name) | Tag of the subnet group. | `string` | `"RDS MySQL DB subnet group"` | no |
| <a name="input_eks_addon_name"></a> [eks\_addon\_name](#input\_eks\_addon\_name) | Name of EKS Cluster Add ON. | `list(string)` | <pre>[<br>  "vpc-cni",<br>  "coredns",<br>  "kube-proxy"<br>]</pre> | no |
| <a name="input_eks_cluster_name"></a> [eks\_cluster\_name](#input\_eks\_cluster\_name) | Name of the EKS cluster | `string` | `"eks-cluster-west1"` | no |
| <a name="input_eks_cluster_tag_name"></a> [eks\_cluster\_tag\_name](#input\_eks\_cluster\_tag\_name) | Tag of EKS Cluster. | `string` | `"eks-cluster-west1"` | no |
| <a name="input_eks_cluster_version"></a> [eks\_cluster\_version](#input\_eks\_cluster\_version) | Kubernetes version to use for the EKS cluster (i.e.: `1.24`) | `string` | `"1.24"` | no |
| <a name="input_eks_egress_cidr_blocks"></a> [eks\_egress\_cidr\_blocks](#input\_eks\_egress\_cidr\_blocks) | Egress CIDR Blocks of security group for EKS. | `list(any)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_eks_egress_rules"></a> [eks\_egress\_rules](#input\_eks\_egress\_rules) | Egress rules of security group for EKS. | `list(any)` | <pre>[<br>  443<br>]</pre> | no |
| <a name="input_eks_egress_rules_from_port"></a> [eks\_egress\_rules\_from\_port](#input\_eks\_egress\_rules\_from\_port) | Egress rules from port of security group for EKS. | `list(any)` | <pre>[<br>  443<br>]</pre> | no |
| <a name="input_eks_egress_rules_protocols"></a> [eks\_egress\_rules\_protocols](#input\_eks\_egress\_rules\_protocols) | Egress rules protocols of security group for EKS. | `list(any)` | <pre>[<br>  "tcp"<br>]</pre> | no |
| <a name="input_eks_egress_rules_to_port"></a> [eks\_egress\_rules\_to\_port](#input\_eks\_egress\_rules\_to\_port) | Egress rules to port of security group for EKS. | `list(any)` | <pre>[<br>  443<br>]</pre> | no |
| <a name="input_eks_ingress_cidr_blocks"></a> [eks\_ingress\_cidr\_blocks](#input\_eks\_ingress\_cidr\_blocks) | Ingress CIDR Blocks of security group for EKS. | `list(any)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_eks_ingress_rules"></a> [eks\_ingress\_rules](#input\_eks\_ingress\_rules) | Ingress rules of security group for EKS. | `list(any)` | <pre>[<br>  22,<br>  80,<br>  443<br>]</pre> | no |
| <a name="input_eks_ingress_rules_from_port"></a> [eks\_ingress\_rules\_from\_port](#input\_eks\_ingress\_rules\_from\_port) | Ingress rules from port of security group for EKS. | `list(any)` | <pre>[<br>  22,<br>  80,<br>  443<br>]</pre> | no |
| <a name="input_eks_ingress_rules_protocols"></a> [eks\_ingress\_rules\_protocols](#input\_eks\_ingress\_rules\_protocols) | Ingress rules protocols of security group for EKS. | `list(any)` | <pre>[<br>  "tcp",<br>  "tcp",<br>  "tcp"<br>]</pre> | no |
| <a name="input_eks_ingress_rules_to_port"></a> [eks\_ingress\_rules\_to\_port](#input\_eks\_ingress\_rules\_to\_port) | Ingress rules to port of security group for EKS. | `list(any)` | <pre>[<br>  22,<br>  80,<br>  443<br>]</pre> | no |
| <a name="input_eks_node_group_ami_type"></a> [eks\_node\_group\_ami\_type](#input\_eks\_node\_group\_ami\_type) | Type of Amazon Machine Image (AMI) associated with the EKS Node Group. Valid values are `AL2_x86_64`, `AL2_x86_64_GPU`, `AL2_ARM_64`, `CUSTOM`, `BOTTLEROCKET_ARM_64`, `BOTTLEROCKET_x86_64` | `string` | `"AL2_x86_64"` | no |
| <a name="input_eks_node_group_desired_size"></a> [eks\_node\_group\_desired\_size](#input\_eks\_node\_group\_desired\_size) | Desired number of instances/nodes | `number` | `2` | no |
| <a name="input_eks_node_group_disk_size"></a> [eks\_node\_group\_disk\_size](#input\_eks\_node\_group\_disk\_size) | Disk size in GiB for nodes. Defaults to `20`. Only valid when `use_custom_launch_template` = `false` | `number` | `30` | no |
| <a name="input_eks_node_group_instance_types"></a> [eks\_node\_group\_instance\_types](#input\_eks\_node\_group\_instance\_types) | Set of instance types associated with the EKS Node Group. Defaults to `["t3.medium"]` | `list(string)` | <pre>[<br>  "t3.medium"<br>]</pre> | no |
| <a name="input_eks_node_group_max_size"></a> [eks\_node\_group\_max\_size](#input\_eks\_node\_group\_max\_size) | Maximum number of instances/nodes | `number` | `3` | no |
| <a name="input_eks_node_group_min_size"></a> [eks\_node\_group\_min\_size](#input\_eks\_node\_group\_min\_size) | Minimum number of instances/nodes | `number` | `2` | no |
| <a name="input_eks_node_group_tag_name"></a> [eks\_node\_group\_tag\_name](#input\_eks\_node\_group\_tag\_name) | Tag of EKS Cluster Node Group. | `string` | `"node-group-west1"` | no |
| <a name="input_eks_security_group_name"></a> [eks\_security\_group\_name](#input\_eks\_security\_group\_name) | Name to use on cluster security group created | `string` | `"eks security group west1"` | no |
| <a name="input_eks_security_group_tag_name"></a> [eks\_security\_group\_tag\_name](#input\_eks\_security\_group\_tag\_name) | Tag of EKS Cluster Security group. | `string` | `"eks test security group"` | no |
| <a name="input_elasticip_name"></a> [elasticip\_name](#input\_elasticip\_name) | Name of the elstic ip. | `string` | `"eip-west1"` | no |
| <a name="input_global_cluster_database_name"></a> [global\_cluster\_database\_name](#input\_global\_cluster\_database\_name) | Database name of global cluster. | `string` | `"testdatabase"` | no |
| <a name="input_global_cluster_deletion_protection"></a> [global\_cluster\_deletion\_protection](#input\_global\_cluster\_deletion\_protection) | Deletion protection of global cluster. | `bool` | `false` | no |
| <a name="input_global_cluster_engine"></a> [global\_cluster\_engine](#input\_global\_cluster\_engine) | Name of global cluster engine or database type. | `string` | `"aurora-mysql"` | no |
| <a name="input_global_cluster_engine_version"></a> [global\_cluster\_engine\_version](#input\_global\_cluster\_engine\_version) | Version of global cluster engine or database. | `string` | `"5.7.mysql_aurora.2.11.2"` | no |
| <a name="input_global_cluster_name"></a> [global\_cluster\_name](#input\_global\_cluster\_name) | Name of global cluster of Aurora MySQL. | `string` | `"global-cluster-1"` | no |
| <a name="input_global_cluster_storage_encrypted"></a> [global\_cluster\_storage\_encrypted](#input\_global\_cluster\_storage\_encrypted) | Storage needs to be encrypted or not of global cluster. | `bool` | `true` | no |
| <a name="input_internet_gateway_name"></a> [internet\_gateway\_name](#input\_internet\_gateway\_name) | Name of the internet gateway. | `string` | `"igw-west1"` | no |
| <a name="input_is_primary_cluster"></a> [is\_primary\_cluster](#input\_is\_primary\_cluster) | Determines whether cluster is primary cluster with writer instance (set to `false` for global cluster and replica clusters) | `bool` | `true` | no |
| <a name="input_nat_gateway_name"></a> [nat\_gateway\_name](#input\_nat\_gateway\_name) | Name of the NAT gateway. | `string` | `"nat-west1"` | no |
| <a name="input_node_group_name"></a> [node\_group\_name](#input\_node\_group\_name) | Name of the EKS managed node group | `string` | `"node-group-west1"` | no |
| <a name="input_private_route_table_name"></a> [private\_route\_table\_name](#input\_private\_route\_table\_name) | Name of the private route table. | `string` | `"route-table-private-west1"` | no |
| <a name="input_private_subnet_cidr"></a> [private\_subnet\_cidr](#input\_private\_subnet\_cidr) | CIDR of the private subnets. | `list(string)` | <pre>[<br>  "10.0.32.0/20",<br>  "10.0.48.0/20"<br>]</pre> | no |
| <a name="input_private_subnet_name"></a> [private\_subnet\_name](#input\_private\_subnet\_name) | Name of the private subnets. | `string` | `"subnet-vpc-1-private"` | no |
| <a name="input_public_route_table_name"></a> [public\_route\_table\_name](#input\_public\_route\_table\_name) | Name of the public route table. | `string` | `"route-table-public-west1"` | no |
| <a name="input_public_subnet_cidr"></a> [public\_subnet\_cidr](#input\_public\_subnet\_cidr) | CIDR of the public subnets. | `list(string)` | <pre>[<br>  "10.0.0.0/20",<br>  "10.0.16.0/20"<br>]</pre> | no |
| <a name="input_public_subnet_name"></a> [public\_subnet\_name](#input\_public\_subnet\_name) | Name of the public subnets. | `string` | `"subnet-vpc-1-public"` | no |
| <a name="input_rds_egress_rules"></a> [rds\_egress\_rules](#input\_rds\_egress\_rules) | Egress rules of security group for RDS. | `list(any)` | <pre>[<br>  0<br>]</pre> | no |
| <a name="input_rds_egress_rules_from_port"></a> [rds\_egress\_rules\_from\_port](#input\_rds\_egress\_rules\_from\_port) | Egress rules from port of security group for RDS. | `list(any)` | <pre>[<br>  0<br>]</pre> | no |
| <a name="input_rds_egress_rules_protocols"></a> [rds\_egress\_rules\_protocols](#input\_rds\_egress\_rules\_protocols) | Egress rules protocols of security group for RDS. | `list(any)` | <pre>[<br>  "-1"<br>]</pre> | no |
| <a name="input_rds_egress_rules_to_port"></a> [rds\_egress\_rules\_to\_port](#input\_rds\_egress\_rules\_to\_port) | Egress rules to port of security group for RDS. | `list(any)` | <pre>[<br>  0<br>]</pre> | no |
| <a name="input_rds_ingress_rules"></a> [rds\_ingress\_rules](#input\_rds\_ingress\_rules) | Ingress rules of security group for RDS. | `list(any)` | <pre>[<br>  3306<br>]</pre> | no |
| <a name="input_rds_ingress_rules_from_port"></a> [rds\_ingress\_rules\_from\_port](#input\_rds\_ingress\_rules\_from\_port) | Ingress rules from port of security group for RDS. | `list(any)` | <pre>[<br>  3306<br>]</pre> | no |
| <a name="input_rds_ingress_rules_protocols"></a> [rds\_ingress\_rules\_protocols](#input\_rds\_ingress\_rules\_protocols) | Ingress rules protocols of security group for RDS. | `list(any)` | <pre>[<br>  "tcp"<br>]</pre> | no |
| <a name="input_rds_ingress_rules_to_port"></a> [rds\_ingress\_rules\_to\_port](#input\_rds\_ingress\_rules\_to\_port) | Ingress rules to port of security group for RDS. | `list(any)` | <pre>[<br>  3306<br>]</pre> | no |
| <a name="input_rds_instance_max_capacity"></a> [rds\_instance\_max\_capacity](#input\_rds\_instance\_max\_capacity) | Maximum number of read replicas permitted when autoscaling is enabled | `number` | `15` | no |
| <a name="input_rds_instance_min_capacity"></a> [rds\_instance\_min\_capacity](#input\_rds\_instance\_min\_capacity) | Minimum number of read replicas permitted when autoscaling is enabled | `number` | `1` | no |
| <a name="input_rds_security_group_name"></a> [rds\_security\_group\_name](#input\_rds\_security\_group\_name) | Name of security group for RDS. | `string` | `"aurora-sg"` | no |
| <a name="input_rds_security_group_tag_name"></a> [rds\_security\_group\_tag\_name](#input\_rds\_security\_group\_tag\_name) | Tag of security group for RDS. | `string` | `"rds test security group"` | no |
| <a name="input_region"></a> [region](#input\_region) | Name of the Region. | `string` | `"us-west-1"` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of subnet IDs used by database subnet group created | `list(string)` | `[]` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | The IPv4 CIDR block for the VPC. | `string` | `"10.0.0.0/16"` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Name of the VPC. | `string` | `"vpc-1"` | no |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
