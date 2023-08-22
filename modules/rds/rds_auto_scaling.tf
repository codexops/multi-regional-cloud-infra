resource "aws_appautoscaling_target" "rds_aurora" {
  service_namespace  = "rds"
  scalable_dimension = "rds:cluster:ReadReplicaCount"
  resource_id        = "cluster:${aws_rds_cluster.cluster.id}"
  min_capacity       = var.rds_instance_min_capacity
  max_capacity       = var.rds_instance_max_capacity
}

resource "aws_appautoscaling_policy" "rds_aurora" {
  name               = var.appautoscaling_policy_name
  service_namespace  = aws_appautoscaling_target.rds_aurora.service_namespace
  scalable_dimension = aws_appautoscaling_target.rds_aurora.scalable_dimension
  resource_id        = aws_appautoscaling_target.rds_aurora.resource_id
  policy_type        = "TargetTrackingScaling"

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = var.appautoscaling_metric_type
    }

    target_value       = var.appautoscaling_target_value
    scale_in_cooldown  = 300
    scale_out_cooldown = 300
  }
}
