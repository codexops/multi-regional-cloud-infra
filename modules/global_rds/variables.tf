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
