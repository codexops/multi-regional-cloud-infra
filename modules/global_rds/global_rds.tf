resource "aws_rds_global_cluster" "global_cluster" {
  global_cluster_identifier = var.global_cluster_name
  database_name             = var.global_cluster_database_name
  engine                    = var.global_cluster_engine
  engine_version            = var.global_cluster_engine_version
  deletion_protection       = var.global_cluster_deletion_protection
  storage_encrypted         = var.global_cluster_storage_encrypted
}
