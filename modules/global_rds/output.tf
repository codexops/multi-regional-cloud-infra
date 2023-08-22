output "global_cluster_id" {
  value = aws_rds_global_cluster.global_cluster.id
}

output "global_cluster_engine" {
  value = aws_rds_global_cluster.global_cluster.engine
}

output "global_cluster_engine_version" {
  value = aws_rds_global_cluster.global_cluster.engine_version
}

output "global_cluster_database_name" {
  value = aws_rds_global_cluster.global_cluster.database_name
}
