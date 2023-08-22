variable "globalaccelerator_name" {
  description = "The name of the accelerator"
  type        = string
  default     = "test-global-acceleraror"
}

variable "globalaccelerator_enabled" {
  description = "Indicates whether the accelerator is enabled. Defaults to `true`."
  type        = bool
  default     = true
}

variable "globalaccelerator_tag_name" {
  description = "Tag of the global accelerator"
  type        = string
  default     = "test-global-acceleraror"
}

variable "globalaccelerator_listener_client_affinity" {
  description = "Listener Client affinity"
  type        = string
  default     = "NONE"
}

variable "globalaccelerator_listener_protocol" {
  description = "Listener protocol"
  type        = string
  default     = "TCP"
}

variable "globalaccelerator_listener_from_port" {
  description = "Listener from port number"
  type        = number
  default     = 80
}

variable "globalaccelerator_listener_to_port" {
  description = "Listener to port number"
  type        = number
  default     = 80
}

variable "globalaccelerator_endpoint_group_region" {
  description = "Listener endpoint group regions."
  type        = list(string)
  default     = ["us-west-1"]
}

variable "globalaccelerator_health_check_interval_seconds" {
  description = "Listener endpoint group health check interval in seconds"
  type        = number
  default     = 30
}

variable "globalaccelerator_endpoint_configuration_weight" {
  description = "Listener endpoint group configuration weight."
  type        = number
  default     = 100
}

variable "globalaccelerator_health_check_protocol" {
  description = "Listener endpoint group health check protoc in seconds"
  type        = string
  default     = "TCP"
}

variable "globalaccelerator_health_check_port" {
  description = "Listener endpoint group health check port."
  type        = number
  default     = 80
}

variable "globalaccelerator_threshold_count" {
  description = "Listener endpoint group threshold count."
  type        = number
  default     = 3
}

variable "globalaccelerator_traffic_dial_percentage" {
  description = "Listener endpoint group traffic dial percentage."
  type        = number
  default     = 100
}

variable "load_balancer_arn" {
  description = "Load balancer arn"
  type        = list(string)
  default     = []
}
