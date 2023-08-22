output "load_balancer_hostname_name" {
  value = join(",", kubernetes_ingress_v1.ingress.status[*].load_balancer[0].ingress[0].hostname)
  depends_on = [
    kubernetes_ingress_v1.ingress
  ]
}
