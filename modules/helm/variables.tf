variable "eks_cluster_name" {
  description = "Name of EKS Cluster"
  type        = string
  default     = null
}


variable "load_balancer_controller_role_arn" {
  description = "Load balancer controller role arn."
  type        = string
  default     = ""
}
