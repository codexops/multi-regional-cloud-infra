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

variable "global_cluster_id" {
  description = "The global cluster identifier specified on `aws_rds_global_cluster`"
  type        = string
  default     = null
}

variable "cluster_backup_retention_period" {
  description = "The days to retain backups for."
  type        = number
  default     = 1
}

variable "cluster_master_username" {
  description = "Username for the master DB user. Required unless `manage_master_user_password` is set to `true` or unless `snapshot_identifier` or `replication_source_identifier` is provided or unless a `global_cluster_identifier` is provided when the cluster is the secondary cluster of a global database"
  type        = string
  default     = null
}

variable "cluster_master_password" {
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file. Required unless `manage_master_user_password` is set to `true` or unless `snapshot_identifier` or `replication_source_identifier` is provided or unless a `global_cluster_identifier` is provided when the cluster is the secondary cluster of a global database"
  type        = string
  default     = null
}

variable "cluster_port" {
  description = "The port on which the DB accepts connections"
  type        = string
  default     = null
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

variable "vpc_id" {
  description = "ID of the VPC where to create security group"
  type        = string
  default     = ""
}

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

variable "rds_ingress_cidr_blocks" {
  description = "Ingress CIDR Blocks of security group for RDS."
  type        = list(any)
  default     = []
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

variable "rds_egress_cidr_blocks" {
  description = "Egress CIDR Blocks of security group for RDS."
  type        = list(any)
  default     = []
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

variable "eks_cluster_name" {
  description = "EKS Cluster name for add rules in security group for access RDS."
  type        = string
  default     = null
}

variable "ingress_rule_database_port" {
  description = "Ingress rule port for RDS cluster."
  type        = number
  default     = 3306
}

variable "ingress_rule_port_protocol" {
  description = "Ingress rule protocol for RDS cluster."
  type        = string
  default     = "tcp"
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

variable "rds_service_role" {
  description = "IAM role used by RDS."
  type        = string
  default     = ""
}

variable "rds_monitoring_role" {
  description = "IAM role used by RDS to send enhanced monitoring metrics to CloudWatch"
  type        = string
  default     = ""
}
