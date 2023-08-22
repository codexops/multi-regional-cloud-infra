module "vpc1" {
  providers                = { aws = aws.AWS_REGION_US_WEST_1 }
  source                   = "../../modules/vpc"
  vpc_cidr                 = "10.0.0.0/16"
  vpc_name                 = "vpc-1"
  public_subnet_name       = "subnet-vpc-1-public"
  public_subnet_cidr       = ["10.0.0.0/20", "10.0.16.0/20"]
  availability_zones       = ["us-west-1a", "us-west-1c"]
  private_subnet_name      = "subnet-vpc-1-private"
  private_subnet_cidr      = ["10.0.32.0/20", "10.0.48.0/20"]
  elasticip_name           = "eip-west1"
  internet_gateway_name    = "igw-west1"
  nat_gateway_name         = "nat-west1"
  private_route_table_name = "route-table-private-west1"
  public_route_table_name  = "route-table-public-west1"
}

module "vpc2" {
  providers                = { aws = aws.AWS_REGION_US_WEST_2 }
  source                   = "../../modules/vpc"
  vpc_cidr                 = "10.0.0.0/16"
  vpc_name                 = "vpc-2"
  public_subnet_name       = "subnet-vpc-2-public"
  public_subnet_cidr       = ["10.0.0.0/20", "10.0.16.0/20", "10.0.32.0/20"]
  availability_zones       = ["us-west-2a", "us-west-2b", "us-west-2c"]
  private_subnet_name      = "subnet-vpc-2-private"
  private_subnet_cidr      = ["10.0.48.0/20", "10.0.64.0/20", "10.0.80.0/20"]
  elasticip_name           = "eip-west2"
  internet_gateway_name    = "igw-west2"
  nat_gateway_name         = "nat-west2"
  private_route_table_name = "route-table-private-west2"
  public_route_table_name  = "route-table-public-west2"
}

module "rds_roles" {
  source = "../../modules/rds_roles"
}

module "global_rds" {
  source                             = "../../modules/global_rds"
  global_cluster_name                = "global-cluster-1"
  global_cluster_database_name       = "testdatabase"
  global_cluster_engine              = "aurora-mysql"
  global_cluster_engine_version      = "5.7.mysql_aurora.2.11.2"
  global_cluster_deletion_protection = false
  global_cluster_storage_encrypted   = true
}

module "rds1" {
  depends_on = [
    module.rds_roles
  ]
  providers = { aws = aws.AWS_REGION_US_WEST_1 }
  source    = "../../modules/rds"

  db_subnet_group_name     = "db-subnet-group-west1"
  subnet_ids               = module.vpc1.private_subnet_id
  db_subnet_group_tag_name = "RDS MySQL DB subnet group"

  is_primary_cluster                   = true
  cluster_name                         = "db-cluster-1"
  cluster_database_name                = module.global_rds.global_cluster_database_name
  cluster_engine                       = module.global_rds.global_cluster_engine
  cluster_engine_version               = module.global_rds.global_cluster_engine_version
  global_cluster_id                    = module.global_rds.global_cluster_id
  cluster_backup_retention_period      = 1
  cluster_master_username              = "admin"
  cluster_master_password              = "somepass123"
  cluster_port                         = 3306
  cluster_deletion_protection          = false
  cluster_preferred_backup_window      = "06:19-06:49"
  cluster_preferred_maintenance_window = "sun:09:58-sun:10:28"
  cluster_skip_final_snapshot          = true
  cluster_storage_encrypted            = true
  cluster_parameter_group_name         = "try-aurora-mysql5-7"
  db_parameter_group_name              = "try-aurora-mysql5-7"
  cluster_family                       = "aurora-mysql5.7"
  rds_monitoring_role                  = module.rds_roles.rds_monitoring_role
  rds_service_role                     = module.rds_roles.rds_service_role

  cluster_instance_count                                 = 2
  cluster_instance_name                                  = "db-cluster-1-instance"
  cluster_instance_class                                 = "db.r5.large"
  cluster_instance_auto_minor_version_upgrade            = true
  cluster_instance_monitoring_interval                   = 60
  cluster_instance_publicly_accessible                   = false
  cluster_instance_performance_insights_enabled          = true
  cluster_instance_performance_insights_retention_period = 7

  vpc_id                      = module.vpc1.vpc_id
  rds_security_group_name     = "aurora-sg-west1"
  rds_security_group_tag_name = "rds test security group"
  rds_ingress_rules           = [3306]
  rds_ingress_cidr_blocks     = ["122.177.234.226/32"]
  rds_ingress_rules_from_port = [3306]
  rds_ingress_rules_to_port   = [3306]
  rds_ingress_rules_protocols = ["tcp"]
  rds_egress_rules            = [0]
  rds_egress_cidr_blocks      = ["0.0.0.0/0"]
  rds_egress_rules_from_port  = [0]
  rds_egress_rules_to_port    = [0]
  rds_egress_rules_protocols  = ["-1"]
  eks_cluster_name            = module.eks1.aws_eks_cluster_name
  ingress_rule_database_port  = 3306
  ingress_rule_port_protocol  = "tcp"

  rds_instance_min_capacity   = 1
  rds_instance_max_capacity   = 15
  appautoscaling_policy_name  = "cpu-auto-scaling"
  appautoscaling_metric_type  = "RDSReaderAverageCPUUtilization"
  appautoscaling_target_value = 75
}

module "rds2" {
  depends_on = [
    module.rds1
  ]
  providers                = { aws = aws.AWS_REGION_US_WEST_2 }
  source                   = "../../modules/rds"
  db_subnet_group_name     = "db-subnet-group-west2"
  subnet_ids               = module.vpc2.public_subnet_id
  db_subnet_group_tag_name = "RDS MySQL DB subnet group"

  is_primary_cluster                   = false
  cluster_name                         = "db-cluster-2"
  cluster_database_name                = module.global_rds.global_cluster_database_name
  cluster_engine                       = module.global_rds.global_cluster_engine
  cluster_engine_version               = module.global_rds.global_cluster_engine_version
  global_cluster_id                    = module.global_rds.global_cluster_id
  cluster_backup_retention_period      = 1
  cluster_master_username              = "admin"
  cluster_master_password              = "somepass123"
  cluster_port                         = 3306
  cluster_deletion_protection          = false
  cluster_preferred_backup_window      = "06:19-06:49"
  cluster_preferred_maintenance_window = "sun:09:58-sun:10:28"
  cluster_skip_final_snapshot          = true
  cluster_storage_encrypted            = true
  cluster_parameter_group_name         = "try-aurora-mysql5-7-west2"
  db_parameter_group_name              = "try-aurora-mysql5-7-west2"
  cluster_family                       = "aurora-mysql5.7"
  rds_monitoring_role                  = module.rds_roles.rds_monitoring_role
  rds_service_role                     = module.rds_roles.rds_service_role

  cluster_instance_count                                 = 2
  cluster_instance_name                                  = "db-cluster-2-instance"
  cluster_instance_class                                 = "db.r5.large"
  cluster_instance_auto_minor_version_upgrade            = true
  cluster_instance_monitoring_interval                   = 60
  cluster_instance_publicly_accessible                   = false
  cluster_instance_performance_insights_enabled          = true
  cluster_instance_performance_insights_retention_period = 7

  vpc_id                      = module.vpc2.vpc_id
  rds_security_group_name     = "aurora-sg-west2"
  rds_security_group_tag_name = "rds test security group"
  rds_ingress_rules           = [3306]
  rds_ingress_cidr_blocks     = ["122.168.250.38/32"]
  rds_ingress_rules_from_port = [3306]
  rds_ingress_rules_to_port   = [3306]
  rds_ingress_rules_protocols = ["tcp"]
  rds_egress_rules            = [0]
  rds_egress_cidr_blocks      = ["0.0.0.0/0"]
  rds_egress_rules_from_port  = [0]
  rds_egress_rules_to_port    = [0]
  rds_egress_rules_protocols  = ["-1"]
  eks_cluster_name            = module.eks2.aws_eks_cluster_name
  ingress_rule_database_port  = 3306
  ingress_rule_port_protocol  = "tcp"

  rds_instance_min_capacity   = 1
  rds_instance_max_capacity   = 15
  appautoscaling_policy_name  = "cpu-auto-scaling"
  appautoscaling_metric_type  = "RDSReaderAverageCPUUtilization"
  appautoscaling_target_value = 75
}

module "eks1" {
  depends_on = [
    module.rds_roles
  ]
  source    = "../../modules/eks"
  providers = { aws = aws.AWS_REGION_US_WEST_1 }

  region                               = "us-west-1"
  eks_cluster_role                     = module.rds_roles.eks_cluster_role
  eks_node_role                        = module.rds_roles.eks_node_role
  eks_cluster_name                     = "eks-cluster-west1"
  eks_cluster_version                  = "1.24"
  cluster_service_ipv4_cidr            = "192.168.0.0/16"
  vpc_id                               = module.vpc1.vpc_id
  subnet_id                            = module.vpc1.public_subnet_id
  cluster_enabled_log_types            = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  cluster_endpoint_private_access      = false
  cluster_endpoint_public_access       = true
  cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"]
  eks_cluster_tag_name                 = "eks-cluster-west1"
  eks_addon_name                       = ["vpc-cni", "coredns", "kube-proxy"]
  eks_addon_version                    = ["v1.12.6-eksbuild.1", "v1.8.7-eksbuild.4", "v1.24.10-eksbuild.2"]

  node_group_name               = "node-group-west1"
  capacity_type                 = "ON_DEMAND"
  eks_node_group_tag_name       = "node-group-west1"
  eks_node_group_instance_types = ["t3.medium"]
  eks_node_group_ami_type       = "AL2_x86_64"
  eks_node_group_disk_size      = 20
  eks_node_group_desired_size   = 2
  eks_node_group_max_size       = 3
  eks_node_group_min_size       = 2

  eks_security_group_name     = "eks security group west1"
  eks_security_group_tag_name = "eks test security group"
  eks_ingress_rules           = [22, 80, 443]
  eks_ingress_cidr_blocks     = ["0.0.0.0/0"]
  eks_ingress_rules_from_port = [22, 80, 443]
  eks_ingress_rules_to_port   = [22, 80, 443]
  eks_ingress_rules_protocols = ["tcp", "tcp", "tcp"]
  eks_egress_rules            = [443]
  eks_egress_cidr_blocks      = ["0.0.0.0/0"]
  eks_egress_rules_from_port  = [443]
  eks_egress_rules_to_port    = [443]
  eks_egress_rules_protocols  = ["tcp"]
}

module "eks2" {
  depends_on = [
    module.rds_roles
  ]
  source                               = "../../modules/eks"
  providers                            = { aws = aws.AWS_REGION_US_WEST_2 }
  region                               = "us-west-2"
  eks_cluster_role                     = module.rds_roles.eks_cluster_role
  eks_node_role                        = module.rds_roles.eks_node_role
  eks_cluster_name                     = "eks-cluster-west2"
  eks_cluster_version                  = "1.24"
  cluster_service_ipv4_cidr            = "172.16.0.0/16"
  vpc_id                               = module.vpc2.vpc_id
  subnet_id                            = module.vpc2.public_subnet_id
  cluster_enabled_log_types            = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  cluster_endpoint_private_access      = false
  cluster_endpoint_public_access       = true
  cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"]
  eks_cluster_tag_name                 = "eks-cluster-west2"
  eks_addon_name                       = ["vpc-cni", "coredns", "kube-proxy"]
  eks_addon_version                    = ["v1.12.6-eksbuild.1", "v1.8.7-eksbuild.4", "v1.24.10-eksbuild.2"]

  node_group_name               = "node-group-west2"
  capacity_type                 = "ON_DEMAND"
  eks_node_group_tag_name       = "node-group-west2"
  eks_node_group_instance_types = ["t3.medium"]
  eks_node_group_ami_type       = "AL2_x86_64"
  eks_node_group_disk_size      = 20
  eks_node_group_desired_size   = 2
  eks_node_group_max_size       = 3
  eks_node_group_min_size       = 2

  eks_security_group_name     = "eks security group west2"
  eks_security_group_tag_name = "eks test security group"
  eks_ingress_rules           = [22, 80, 443]
  eks_ingress_cidr_blocks     = ["0.0.0.0/0"]
  eks_ingress_rules_from_port = [22, 80, 443]
  eks_ingress_rules_to_port   = [22, 80, 443]
  eks_ingress_rules_protocols = ["tcp", "tcp", "tcp"]
  eks_egress_rules            = [443]
  eks_egress_cidr_blocks      = ["0.0.0.0/0"]
  eks_egress_rules_from_port  = [443]
  eks_egress_rules_to_port    = [443]
  eks_egress_rules_protocols  = ["tcp"]
}

data "aws_eks_cluster" "eks_cluster_us_west_1" {
  provider = aws.AWS_REGION_US_WEST_1
  depends_on = [
    module.eks1
  ]
  name = module.eks1.aws_eks_cluster_name
}

data "aws_eks_cluster" "eks_cluster_us_west_2" {
  provider = aws.AWS_REGION_US_WEST_2
  depends_on = [
    module.eks2
  ]
  name = module.eks2.aws_eks_cluster_name
}

data "aws_eks_cluster_auth" "eks_cluster_us_west_1" {
  provider = aws.AWS_REGION_US_WEST_1
  name     = module.eks1.aws_eks_cluster_name
}

data "aws_eks_cluster_auth" "eks_cluster_us_west_2" {
  provider = aws.AWS_REGION_US_WEST_2
  name     = module.eks2.aws_eks_cluster_name
}

module "helm1" {
  providers = { helm = helm.AWS_REGION_US_WEST_1, kubectl = kubectl.AWS_REGION_US_WEST_1 }
  depends_on = [
    module.eks1, module.vpc1
  ]
  source                            = "../../modules/helm"
  load_balancer_controller_role_arn = module.eks1.load_balancer_controller_role_arn
  eks_cluster_name                  = data.aws_eks_cluster.eks_cluster_us_west_1.id
}

module "helm2" {
  providers = { helm = helm.AWS_REGION_US_WEST_2, kubectl = kubectl.AWS_REGION_US_WEST_2 }
  depends_on = [
    module.eks2, module.vpc2
  ]
  source                            = "../../modules/helm"
  load_balancer_controller_role_arn = module.eks2.load_balancer_controller_role_arn
  eks_cluster_name                  = data.aws_eks_cluster.eks_cluster_us_west_2.id
}

module "k8s1" {
  providers = { kubernetes = kubernetes.AWS_REGION_US_WEST_1 }
  source    = "../../modules/k8s"
  depends_on = [
    module.helm1, module.eks1
  ]
  namespace                     = "game-20481"
  deployment_name               = "deployment-2048"
  deployment_replicas           = "5"
  deployment_matchlabels        = "app-2048"
  deployment_container_name     = "app-2048"
  deployment_container_port     = 80
  deployment_container_protocol = "TCP"
  deployment_container_image    = "devteds/demo-bookstore-website:1.0" //"public.ecr.aws/l6m2t8p7/docker-2048:latest"
  service_name                  = "service-2048"
  service_protocol              = "TCP"
  service_port                  = 80
  service_type                  = "NodePort"
  ingress_name                  = "ingress-2048"
  ingress_load_balancer_name    = "test-alb"
}

module "k8s2" {
  providers = { kubernetes = kubernetes.AWS_REGION_US_WEST_2 }
  source    = "../../modules/k8s"
  depends_on = [
    module.helm2, module.eks2
  ]
  namespace                     = "game-20481"
  deployment_name               = "deployment-2048"
  deployment_replicas           = "5"
  deployment_matchlabels        = "app-2048"
  deployment_container_name     = "app-2048"
  deployment_container_port     = 80
  deployment_container_protocol = "TCP"
  deployment_container_image    = "devteds/demo-bookstore-website:1.0" //"public.ecr.aws/l6m2t8p7/docker-2048:latest"
  service_name                  = "service-2048"
  service_protocol              = "TCP"
  service_port                  = 80
  service_type                  = "NodePort"
  ingress_name                  = "ingress-2048"
  ingress_load_balancer_name    = "test-alb-west2"
}

data "aws_lb" "load_balancer1" {
  depends_on = [
    module.eks1, module.k8s1
  ]
  provider = aws.AWS_REGION_US_WEST_1
  name     = "test-alb"
}

data "aws_lb" "load_balancer2" {
  depends_on = [
    module.eks2, module.k8s2
  ]
  provider = aws.AWS_REGION_US_WEST_2
  name     = "test-alb-west2"
}

module "globalaccelerator" {
  depends_on = [
    module.k8s1, module.helm1, module.k8s2, module.helm2
  ]
  source                                          = "../../modules/global_accelerator"
  globalaccelerator_name                          = "test-global-acceleraror"
  globalaccelerator_tag_name                      = "global-acceleraror-tag"
  globalaccelerator_enabled                       = true
  globalaccelerator_listener_client_affinity      = "NONE"
  globalaccelerator_listener_protocol             = "TCP"
  globalaccelerator_listener_from_port            = 80
  globalaccelerator_listener_to_port              = 80
  globalaccelerator_endpoint_group_region         = ["us-west-1", "us-west-2"]
  globalaccelerator_health_check_protocol         = "TCP"
  globalaccelerator_health_check_interval_seconds = 30
  globalaccelerator_health_check_port             = 80
  globalaccelerator_threshold_count               = 3
  globalaccelerator_traffic_dial_percentage       = 100
  globalaccelerator_endpoint_configuration_weight = 100
  load_balancer_arn                               = [data.aws_lb.load_balancer1.arn, data.aws_lb.load_balancer2.arn]
}
