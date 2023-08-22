resource "aws_eks_cluster" "eks_cluster" {
  name     = var.eks_cluster_name
  version  = var.eks_cluster_version
  role_arn = var.eks_cluster_role
  kubernetes_network_config {
    ip_family         = "ipv4"
    service_ipv4_cidr = var.cluster_service_ipv4_cidr
  }
  vpc_config {
    endpoint_private_access = var.cluster_endpoint_private_access
    endpoint_public_access  = var.cluster_endpoint_public_access
    public_access_cidrs     = var.cluster_endpoint_public_access_cidrs
    security_group_ids      = [aws_security_group.eks_security_group.id]
    subnet_ids              = var.subnet_id
  }
  enabled_cluster_log_types = var.cluster_enabled_log_types
  tags = {
    Name = var.eks_cluster_tag_name
  }
  depends_on = [
    aws_security_group.eks_security_group
  ]
}

resource "aws_eks_addon" "addon" {
  count             = length(var.eks_addon_name)
  addon_name        = var.eks_addon_name[count.index]
  addon_version     = var.eks_addon_version[count.index]
  cluster_name      = aws_eks_cluster.eks_cluster.id
  resolve_conflicts = "OVERWRITE"
}

resource "aws_eks_node_group" "node_group" {
  node_group_name = var.node_group_name
  cluster_name    = aws_eks_cluster.eks_cluster.id
  node_role_arn   = var.eks_node_role
  capacity_type   = var.capacity_type
  subnet_ids      = var.subnet_id
  ami_type        = var.eks_node_group_ami_type
  disk_size       = var.eks_node_group_disk_size
  instance_types  = var.eks_node_group_instance_types

  tags = {
    Name = var.eks_node_group_tag_name
  }

  scaling_config {
    desired_size = var.eks_node_group_desired_size
    min_size     = var.eks_node_group_min_size
    max_size     = var.eks_node_group_max_size
  }
}

data "tls_certificate" "eks" {
  depends_on = [
    aws_eks_cluster.eks_cluster
  ]
  url = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}

resource "aws_iam_openid_connect_provider" "eks" {
  depends_on = [
    aws_eks_cluster.eks_cluster
  ]
  url = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer

  client_id_list = ["sts.amazonaws.com"]

  thumbprint_list = [data.tls_certificate.eks.certificates[0].sha1_fingerprint]
}
