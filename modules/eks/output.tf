output "aws_eks_cluster_name" {
  value = aws_eks_cluster.eks_cluster.id
}

output "load_balancer_controller_role_arn" {
  value = aws_iam_role.load_balancer_controller_role.arn
}
