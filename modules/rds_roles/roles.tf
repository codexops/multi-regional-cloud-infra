data "aws_iam_role" "rds_service_role" {
  name = "AWSServiceRoleForRDS"
}

resource "aws_iam_role" "eks_cluster_role" {
  name                  = "eksClusterRole"
  description           = "Allows access to other AWS service resources that are required to operate clusters managed by EKS."
  path                  = "/"
  assume_role_policy    = file("${path.module}/roles/eks_cluster_role.json")
  force_detach_policies = false
  managed_policy_arns   = [data.aws_iam_policy.eks_cluster_policy.arn]
}


resource "aws_iam_role" "eks_node_role" {
  name                  = "eksNodeRole"
  description           = "Amazon EKS - Node role."
  path                  = "/"
  assume_role_policy    = file("${path.module}/roles/eks_node_role.json")
  force_detach_policies = false
  managed_policy_arns = [
    data.aws_iam_policy.ec2_container_registry_read_only_policy.arn,
    data.aws_iam_policy.eks_worker_node_policy.arn,
    data.aws_iam_policy.eks_cni_policy.arn
  ]
}

resource "aws_iam_role" "rds_monitoring_role" {
  name                  = "rdsMonitoringRole"
  description           = "Allows access to RDS service resources that are required to fetch logs and metrics by Cloudwatch."
  path                  = "/"
  assume_role_policy    = file("${path.module}/roles/rds_monitoring_role.json")
  force_detach_policies = false
  managed_policy_arns   = [data.aws_iam_policy.rds_monitoring_policy.arn]
}
