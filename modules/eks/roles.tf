data "aws_caller_identity" "current" {}

resource "aws_iam_role" "load_balancer_controller_role" {
  name        = "AmazonEKSLoadBalancerControllerRole-${var.region}"
  description = "Amazon EKS - Load Balancer Controller role."
  path        = "/"
  assume_role_policy = jsonencode({


    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Federated = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/oidc.eks.${var.region}.amazonaws.com/id/${split("/", aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer)[4]}"
        },
        Action = "sts:AssumeRoleWithWebIdentity",
        Condition = {
          StringEquals = {
            "oidc.eks.${var.region}.amazonaws.com/id/${split("/", aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer)[4]}:aud" : "sts.amazonaws.com",
            "oidc.eks.${var.region}.amazonaws.com/id/${split("/", aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer)[4]}:sub" : "system:serviceaccount:kube-system:aws-load-balancer-controller"
          }
        }
      }
    ]
  })
  force_detach_policies = false
  managed_policy_arns = [
    data.aws_iam_policy.load_balancer_controller_policy.arn
  ]
}
