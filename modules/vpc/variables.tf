variable "vpc_cidr" {
  description = "The IPv4 CIDR block for the VPC."
  default     = "10.0.0.0/16"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC."
  default     = "vpc-1"
  type        = string
}

variable "public_subnet_name" {
  description = "Name of the public subnets."
  default     = "subnet-vpc-1-public"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR of the public subnets."
  default     = ["10.0.0.0/20", "10.0.16.0/20"]
  type        = list(string)
}

variable "availability_zones" {
  description = "A list of availability zones names in the region"
  default     = ["us-west-1a", "us-west-1c"]
  type        = list(string)
}

variable "private_subnet_name" {
  description = "Name of the private subnets."
  default     = "subnet-vpc-1-private"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR of the private subnets."
  default     = ["10.0.32.0/20", "10.0.48.0/20"]
  type        = list(string)
}

variable "elasticip_name" {
  description = "Name of the elstic ip."
  default     = "eip-west1"
  type        = string
}

variable "internet_gateway_name" {
  description = "Name of the internet gateway."
  default     = "igw-west1"
  type        = string
}

variable "nat_gateway_name" {
  description = "Name of the NAT gateway."
  default     = "nat-west1"
  type        = string
}

variable "public_route_table_name" {
  description = "Name of the public route table."
  default     = "route-table-public-west1"
  type        = string
}

variable "private_route_table_name" {
  description = "Name of the private route table."
  default     = "route-table-private-west1"
  type        = string
}
