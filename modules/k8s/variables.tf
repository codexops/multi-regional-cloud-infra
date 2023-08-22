variable "namespace" {
  description = "Namespace in EKS Cluster"
  type        = string
  default     = "game-20481"
}

variable "deployment_name" {
  description = "Deployment Name in EKS Cluster"
  type        = string
  default     = "deployment-2048"
}

variable "deployment_replicas" {
  description = "Deployment replicas in EKS Cluster"
  type        = number
  default     = 5
}

variable "deployment_matchlabels" {
  description = "Deployment matchlabels in EKS Cluster"
  type        = string
  default     = "app-2048"
}

variable "deployment_container_name" {
  description = "Deployment container name in EKS Cluster"
  type        = string
  default     = "app-2048"
}

variable "deployment_container_port" {
  description = "Deployment container port in EKS Cluster"
  type        = number
  default     = 80
}

variable "deployment_container_protocol" {
  description = "Deployment container protocol in EKS Cluster"
  type        = string
  default     = "TCP"
}

variable "deployment_container_image" {
  description = "Deployment container image in EKS Cluster"
  type        = string
  default     = "public.ecr.aws/l6m2t8p7/docker-2048:latest"
}

variable "service_name" {
  description = "Service name in EKS Cluster"
  type        = string
  default     = "service-2048"
}

variable "service_protocol" {
  description = "Service protocol in EKS Cluster"
  type        = string
  default     = "TCP"
}

variable "service_port" {
  description = "Service port in EKS Cluster"
  type        = number
  default     = 80
}

variable "service_type" {
  description = "Service type in EKS Cluster"
  type        = string
  default     = "NodePort"
}

variable "ingress_name" {
  description = "Ingress name in EKS Cluster"
  type        = string
  default     = "ingress-2048"
}

variable "ingress_load_balancer_name" {
  description = "Ingress load balancer name in EKS Cluster"
  type        = string
  default     = "test-alb"
}
