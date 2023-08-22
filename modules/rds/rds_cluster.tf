resource "aws_rds_cluster" "cluster" {
  cluster_identifier           = var.cluster_name
  database_name                = var.is_primary_cluster ? var.cluster_database_name : null
  engine                       = var.cluster_engine
  engine_mode                  = "provisioned"
  engine_version               = var.cluster_engine_version
  global_cluster_identifier    = var.global_cluster_id
  db_subnet_group_name         = aws_db_subnet_group.subnet_group.name
  backup_retention_period      = var.cluster_backup_retention_period
  master_username              = var.is_primary_cluster ? var.cluster_master_username : null
  master_password              = var.is_primary_cluster ? var.cluster_master_password : null
  network_type                 = "IPV4"
  port                         = var.cluster_port
  deletion_protection          = var.cluster_deletion_protection
  vpc_security_group_ids       = [aws_security_group.rds_security_group.id]
  iam_roles                    = [var.rds_service_role]
  preferred_backup_window      = var.cluster_preferred_backup_window
  preferred_maintenance_window = var.cluster_preferred_maintenance_window
  skip_final_snapshot          = var.cluster_skip_final_snapshot
  storage_encrypted            = var.cluster_storage_encrypted
  kms_key_id                   = aws_kms_key.key.arn
  enabled_cloudwatch_logs_exports = [
    "audit",
    "error",
    "general",
    "slowquery"
  ]
  db_cluster_parameter_group_name  = aws_rds_cluster_parameter_group.cluster_parameter_group.id
  db_instance_parameter_group_name = aws_db_parameter_group.db_parameter_group.id
}

resource "aws_rds_cluster_instance" "cluster_instance" {
  depends_on = [
    aws_rds_cluster.cluster
  ]
  count                                 = var.cluster_instance_count
  identifier                            = "${var.cluster_instance_name}-${count.index + 1}"
  cluster_identifier                    = aws_rds_cluster.cluster.id
  publicly_accessible                   = var.cluster_instance_publicly_accessible
  db_subnet_group_name                  = aws_db_subnet_group.subnet_group.name
  engine                                = aws_rds_cluster.cluster.engine
  engine_version                        = aws_rds_cluster.cluster.engine_version
  instance_class                        = var.cluster_instance_class
  auto_minor_version_upgrade            = var.cluster_instance_auto_minor_version_upgrade
  monitoring_interval                   = var.cluster_instance_monitoring_interval
  monitoring_role_arn                   = var.rds_monitoring_role
  performance_insights_enabled          = var.cluster_instance_performance_insights_enabled
  performance_insights_retention_period = var.cluster_instance_performance_insights_retention_period
  db_parameter_group_name               = aws_db_parameter_group.db_parameter_group.id
}

resource "aws_rds_cluster_parameter_group" "cluster_parameter_group" {
  description = "Cluster parameter group for ${var.cluster_family}."
  family      = var.cluster_family
  name        = var.cluster_parameter_group_name
}

resource "aws_db_parameter_group" "db_parameter_group" {
  description = "DB parameter group for ${var.cluster_family}."
  family      = var.cluster_family
  name        = var.db_parameter_group_name
}
