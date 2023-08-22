resource "aws_globalaccelerator_accelerator" "globalaccelerator" {
  name            = var.globalaccelerator_name
  enabled         = var.globalaccelerator_enabled
  ip_address_type = "IPV4"
  tags = {
    Name = var.globalaccelerator_tag_name
  }
}

resource "aws_globalaccelerator_listener" "globalaccelerator_listener" {
  accelerator_arn = aws_globalaccelerator_accelerator.globalaccelerator.id
  client_affinity = var.globalaccelerator_listener_client_affinity
  protocol        = var.globalaccelerator_listener_protocol

  port_range {
    from_port = var.globalaccelerator_listener_from_port
    to_port   = var.globalaccelerator_listener_to_port
  }
}

resource "aws_globalaccelerator_endpoint_group" "globalaccelerator_endpoint" {
  count                         = length(var.globalaccelerator_endpoint_group_region)
  listener_arn                  = aws_globalaccelerator_listener.globalaccelerator_listener.id
  endpoint_group_region         = var.globalaccelerator_endpoint_group_region[count.index]
  health_check_protocol         = var.globalaccelerator_health_check_protocol
  health_check_interval_seconds = var.globalaccelerator_health_check_interval_seconds
  health_check_port             = var.globalaccelerator_health_check_port
  threshold_count               = var.globalaccelerator_threshold_count
  traffic_dial_percentage       = var.globalaccelerator_traffic_dial_percentage
  endpoint_configuration {
    endpoint_id = var.load_balancer_arn[count.index]
    weight      = var.globalaccelerator_endpoint_configuration_weight
  }
}
