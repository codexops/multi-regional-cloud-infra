resource "kubectl_manifest" "load_balancer_service_account" {
  yaml_body = <<YAML
apiVersion: v1
kind: ServiceAccount
metadata:
  labels:
    app.kubernetes.io/component: controller
    app.kubernetes.io/name: aws-load-balancer-controller
  name: aws-load-balancer-controller
  namespace: kube-system
  annotations:
    eks.amazonaws.com/role-arn: ${var.load_balancer_controller_role_arn}       
YAML
}

resource "helm_release" "aws_load_balancer_controller" {
  depends_on = [
    kubectl_manifest.load_balancer_service_account
  ]
  name             = "aws-load-balancer-controller"
  chart            = "aws-load-balancer-controller"
  create_namespace = false
  repository       = "https://aws.github.io/eks-charts"
  namespace        = "kube-system"
  set {
    name  = "clusterName"
    value = var.eks_cluster_name
  }
  set {
    name  = "serviceAccount.create"
    value = false
  }
  set {
    name  = "serviceAccount.name"
    value = "aws-load-balancer-controller"
  }
}
