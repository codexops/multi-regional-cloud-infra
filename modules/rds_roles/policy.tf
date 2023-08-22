data "aws_iam_policy" "eks_cluster_policy" {
  name = "AmazonEKSClusterPolicy"
}

data "aws_iam_policy" "eks_worker_node_policy" {
  name = "AmazonEKSWorkerNodePolicy"
}

data "aws_iam_policy" "ec2_container_registry_read_only_policy" {
  name = "AmazonEC2ContainerRegistryReadOnly"
}

data "aws_iam_policy" "eks_cni_policy" {
  name = "AmazonEKS_CNI_Policy"
}


resource "aws_iam_policy" "load_balancer_controller_policy" {
  name        = "AWSLoadBalancerControllerIAMPolicy"
  path        = "/"
  description = "My AWSLoadBalancerControllerIAMPolicy policy"

  policy = file("${path.module}/policy/aws_load_balancer_controller_policy.json")
}


data "aws_iam_policy" "rds_monitoring_policy" {
  name = "AmazonRDSEnhancedMonitoringRole"
}

data "aws_iam_policy" "rds_service_role_policy" {
  name = "AmazonRDSServiceRolePolicy"
}
