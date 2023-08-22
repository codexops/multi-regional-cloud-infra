########################################################
# VPC Variables
########################################################

variable "vpc_cidr" {
  description = "The IPv4 CIDR block for the VPC."
  default     = "10.0.0.0/16"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC."
  default     = "vpc-1"
  type        = string
}

variable "public_subnet_name" {
  description = "Name of the public subnets."
  default     = "subnet-vpc-1-public"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR of the public subnets."
  default     = ["10.0.0.0/20", "10.0.16.0/20"]
  type        = list(string)
}

variable "availability_zones" {
  description = "A list of availability zones names in the region"
  default     = ["us-west-1a", "us-west-1c"]
  type        = list(string)
}

variable "private_subnet_name" {
  description = "Name of the private subnets."
  default     = "subnet-vpc-1-private"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR of the private subnets."
  default     = ["10.0.32.0/20", "10.0.48.0/20"]
  type        = list(string)
}

variable "elasticip_name" {
  description = "Name of the elstic ip."
  default     = "eip-west1"
  type        = string
}

variable "internet_gateway_name" {
  description = "Name of the internet gateway."
  default     = "igw-west1"
  type        = string
}

variable "nat_gateway_name" {
  description = "Name of the NAT gateway."
  default     = "nat-west1"
  type        = string
}

variable "public_route_table_name" {
  description = "Name of the public route table."
  default     = "route-table-public-west1"
  type        = string
}

variable "private_route_table_name" {
  description = "Name of the private route table."
  default     = "route-table-private-west1"
  type        = string
}

########################################################
# Global Cluster Variables
########################################################

variable "global_cluster_name" {
  description = "Name of global cluster of Aurora MySQL."
  default     = "global-cluster-1"
  type        = string
}

variable "global_cluster_engine" {
  description = "Name of global cluster engine or database type."
  default     = "aurora-mysql"
  type        = string
}

variable "global_cluster_engine_version" {
  description = "Version of global cluster engine or database."
  default     = "5.7.mysql_aurora.2.11.2"
  type        = string
}

variable "global_cluster_deletion_protection" {
  description = "Deletion protection of global cluster."
  default     = false
  type        = bool
}

variable "global_cluster_storage_encrypted" {
  description = "Storage needs to be encrypted or not of global cluster."
  default     = true
  type        = bool
}

variable "global_cluster_database_name" {
  description = "Database name of global cluster."
  default     = "testdatabase"
  type        = string
}

########################################################
# Subnet Group Variables
########################################################

variable "db_subnet_group_name" {
  description = "The name of the subnet group name."
  type        = string
  default     = "db-subnet-group-west1"
}

variable "subnet_ids" {
  description = "List of subnet IDs used by database subnet group created"
  type        = list(string)
  default     = []
}

variable "db_subnet_group_tag_name" {
  description = "Tag of the subnet group."
  type        = string
  default     = "RDS MySQL DB subnet group"
}

########################################################
# Cluster Variables
########################################################

variable "is_primary_cluster" {
  description = "Determines whether cluster is primary cluster with writer instance (set to `false` for global cluster and replica clusters)"
  type        = bool
  default     = true
}

variable "cluster_name" {
  description = "Name of the RDS Cluster."
  type        = string
  default     = "db-cluster-1"
}

variable "cluster_database_name" {
  description = "Name for an automatically created database on cluster creation"
  type        = string
  default     = "testdatabase"
}
variable "cluster_engine" {
  description = "The name of the database engine to be used for this DB cluster."
  type        = string
  default     = "aurora-mysql"
}

variable "cluster_engine_version" {
  description = "The database engine version."
  type        = string
  default     = "5.7.mysql_aurora.2.11.2"
}

variable "cluster_backup_retention_period" {
  description = "The days to retain backups for."
  type        = number
  default     = 1
}

variable "cluster_deletion_protection" {
  description = "If the DB instance should have deletion protection enabled. The database can't be deleted when this value is set to `true`. The default is `false`"
  type        = bool
  default     = false
}

variable "cluster_preferred_backup_window" {
  description = "The daily time range during which automated backups are created if automated backups are enabled using the `backup_retention_period` parameter. Time in UTC"
  type        = string
  default     = "02:00-03:00"
}

variable "cluster_preferred_maintenance_window" {
  description = "The weekly time range during which system maintenance can occur, in (UTC)"
  type        = string
  default     = "sun:05:00-sun:06:00"
}

variable "cluster_skip_final_snapshot" {
  description = "Determines whether a final snapshot is created before the cluster is deleted. If true is specified, no snapshot is created"
  type        = bool
  default     = true
}

variable "cluster_storage_encrypted" {
  description = "Specifies whether the DB cluster is encrypted. The default is `true`"
  type        = bool
  default     = true
}

variable "cluster_parameter_group_name" {
  description = "The name of the cluster parameter group"
  type        = string
  default     = "cluster-parameter-group1-mysql5-7"
}

variable "db_parameter_group_name" {
  description = "The name of the DB parameter group"
  type        = string
  default     = "db-parameter-group1-mysql5-7"
}

variable "cluster_family" {
  description = "The family of the DB cluster parameter group"
  type        = string
  default     = "aurora-mysql5.7"
}

########################################################
# Cluster Instance Variables
########################################################

variable "cluster_instance_count" {
  description = "count of instance in cluster"
  type        = number
  default     = 2
}

variable "cluster_instance_name" {
  description = "Name of cluster instances"
  type        = string
  default     = "db-cluster-1-instance"
}

variable "cluster_instance_class" {
  description = "Instance type to use at master instance. Note: if `autoscaling_enabled` is `true`, this will be the same instance class used on instances created by autoscaling"
  type        = string
  default     = "db.r5.large"
}

variable "cluster_instance_auto_minor_version_upgrade" {
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window. Default `true`"
  type        = bool
  default     = true
}

variable "cluster_instance_monitoring_interval" {
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for instances."
  type        = number
  default     = 60
}

variable "cluster_instance_publicly_accessible" {
  description = "Determines whether instances are publicly accessible. Default `false`"
  type        = bool
  default     = false
}

variable "cluster_instance_performance_insights_enabled" {
  description = "Specifies whether Performance Insights is enabled or not"
  type        = bool
  default     = true
}

variable "cluster_instance_performance_insights_retention_period" {
  description = "Amount of time in days to retain Performance Insights data."
  type        = number
  default     = 7
}

########################################################
# Cluster Instance Security Group Variables
########################################################

variable "rds_security_group_name" {
  description = "Name of security group for RDS."
  type        = string
  default     = "aurora-sg"
}

variable "rds_security_group_tag_name" {
  description = "Tag of security group for RDS."
  type        = string
  default     = "rds test security group"
}

variable "rds_ingress_rules" {
  description = "Ingress rules of security group for RDS."
  type        = list(any)
  default     = [3306]
}

variable "rds_ingress_rules_from_port" {
  description = "Ingress rules from port of security group for RDS."
  type        = list(any)
  default     = [3306]
}

variable "rds_ingress_rules_to_port" {
  description = "Ingress rules to port of security group for RDS."
  type        = list(any)
  default     = [3306]
}

variable "rds_ingress_rules_protocols" {
  description = "Ingress rules protocols of security group for RDS."
  type        = list(any)
  default     = ["tcp"]
}

variable "rds_egress_rules" {
  description = "Egress rules of security group for RDS."
  type        = list(any)
  default     = [0]
}
variable "rds_egress_rules_from_port" {
  description = "Egress rules from port of security group for RDS."
  type        = list(any)
  default     = [0]
}

variable "rds_egress_rules_to_port" {
  description = "Egress rules to port of security group for RDS."
  type        = list(any)
  default     = [0]
}

variable "rds_egress_rules_protocols" {
  description = "Egress rules protocols of security group for RDS."
  type        = list(any)
  default     = ["-1"]
}

########################################################
# Cluster Instance Autoscaling Variables
########################################################

variable "rds_instance_min_capacity" {
  description = "Minimum number of read replicas permitted when autoscaling is enabled"
  type        = number
  default     = 1
}

variable "rds_instance_max_capacity" {
  description = "Maximum number of read replicas permitted when autoscaling is enabled"
  type        = number
  default     = 15
}

variable "appautoscaling_policy_name" {
  description = "Autoscaling policy name"
  type        = string
  default     = "cpu-auto-scaling"
}

variable "appautoscaling_metric_type" {
  description = "The metric type to scale on. Valid values are `RDSReaderAverageCPUUtilization` and `RDSReaderAverageDatabaseConnections`"
  type        = string
  default     = "RDSReaderAverageCPUUtilization"
}

variable "appautoscaling_target_value" {
  description = "CPU threshold which will initiate autoscaling"
  type        = number
  default     = 70
}

########################################################
# EKS Cluster Variables
########################################################

variable "region" {
  description = "Name of the Region."
  type        = string
  default     = "us-west-1"
}

variable "eks_cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "eks-cluster-west1"
}

variable "eks_cluster_version" {
  description = "Kubernetes version to use for the EKS cluster (i.e.: `1.24`)"
  type        = string
  default     = "1.24"
}
variable "cluster_service_ipv4_cidr" {
  description = "The CIDR block to assign Kubernetes service IP addresses from. If you don't specify a block, Kubernetes assigns addresses from either the 10.100.0.0/16 or 172.20.0.0/16 CIDR blocks"
  type        = string
  default     = "192.168.0.0/16"
}

variable "cluster_endpoint_private_access" {
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled"
  type        = bool
  default     = true
}

variable "cluster_endpoint_public_access" {
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled"
  type        = bool
  default     = false
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "List of CIDR blocks which can access the Amazon EKS public API server endpoint"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "cluster_enabled_log_types" {
  description = "A list of the desired control plane logs to enable. For more information, see Amazon EKS Control Plane Logging documentation (https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html)"
  type        = list(string)
  default     = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
}

variable "eks_cluster_tag_name" {
  description = "Tag of EKS Cluster."
  type        = string
  default     = "eks-cluster-west1"
}

########################################################
# EKS Cluster Add ON Variables
########################################################

variable "eks_addon_name" {
  description = "Name of EKS Cluster Add ON."
  type        = list(string)
  default     = ["vpc-cni", "coredns", "kube-proxy"]
}

########################################################
# EKS Cluster Node Group Variables
########################################################

variable "node_group_name" {
  description = "Name of the EKS managed node group"
  type        = string
  default     = "node-group-west1"
}
variable "capacity_type" {
  description = "Type of capacity associated with the EKS Node Group. Valid values: `ON_DEMAND`, `SPOT`"
  type        = string
  default     = "ON_DEMAND"
}

variable "eks_node_group_ami_type" {
  description = "Type of Amazon Machine Image (AMI) associated with the EKS Node Group. Valid values are `AL2_x86_64`, `AL2_x86_64_GPU`, `AL2_ARM_64`, `CUSTOM`, `BOTTLEROCKET_ARM_64`, `BOTTLEROCKET_x86_64`"
  type        = string
  default     = "AL2_x86_64"
}

variable "eks_node_group_disk_size" {
  description = "Disk size in GiB for nodes. Defaults to `20`. Only valid when `use_custom_launch_template` = `false`"
  type        = number
  default     = 30
}

variable "eks_node_group_instance_types" {
  description = "Set of instance types associated with the EKS Node Group. Defaults to `[\"t3.medium\"]`"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "eks_node_group_tag_name" {
  description = "Tag of EKS Cluster Node Group."
  type        = string
  default     = "node-group-west1"
}

variable "eks_node_group_desired_size" {
  description = "Desired number of instances/nodes"
  type        = number
  default     = 2
}

variable "eks_node_group_min_size" {
  description = "Minimum number of instances/nodes"
  type        = number
  default     = 2
}

variable "eks_node_group_max_size" {
  description = "Maximum number of instances/nodes"
  type        = number
  default     = 3
}

########################################################
# EKS Cluster Security Group Variables
########################################################

variable "eks_security_group_name" {
  description = "Name to use on cluster security group created"
  type        = string
  default     = "eks security group west1"
}

variable "eks_security_group_tag_name" {
  description = "Tag of EKS Cluster Security group."
  type        = string
  default     = "eks test security group"
}

variable "eks_ingress_rules" {
  description = "Ingress rules of security group for EKS."
  type        = list(any)
  default     = [22, 80, 443]
}

variable "eks_ingress_cidr_blocks" {
  description = "Ingress CIDR Blocks of security group for EKS."
  type        = list(any)
  default     = ["0.0.0.0/0"]
}

variable "eks_ingress_rules_from_port" {
  description = "Ingress rules from port of security group for EKS."
  type        = list(any)
  default     = [22, 80, 443]
}

variable "eks_ingress_rules_to_port" {
  description = "Ingress rules to port of security group for EKS."
  type        = list(any)
  default     = [22, 80, 443]
}

variable "eks_ingress_rules_protocols" {
  description = "Ingress rules protocols of security group for EKS."
  type        = list(any)
  default     = ["tcp", "tcp", "tcp"]
}

variable "eks_egress_rules" {
  description = "Egress rules of security group for EKS."
  type        = list(any)
  default     = [443]
}

variable "eks_egress_cidr_blocks" {
  description = "Egress CIDR Blocks of security group for EKS."
  type        = list(any)
  default     = ["0.0.0.0/0"]
}

variable "eks_egress_rules_from_port" {
  description = "Egress rules from port of security group for EKS."
  type        = list(any)
  default     = [443]
}

variable "eks_egress_rules_to_port" {
  description = "Egress rules to port of security group for EKS."
  type        = list(any)
  default     = [443]
}

variable "eks_egress_rules_protocols" {
  description = "Egress rules protocols of security group for EKS."
  type        = list(any)
  default     = ["tcp"]
}
