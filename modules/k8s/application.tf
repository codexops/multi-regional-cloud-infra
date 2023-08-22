resource "kubernetes_namespace" "namespace" {
  metadata {
    name = var.namespace
  }
}

resource "kubernetes_deployment" "deployment" {
  depends_on = [
    kubernetes_namespace.namespace
  ]

  metadata {
    name      = var.deployment_name
    namespace = var.namespace
  }

  spec {
    replicas = var.deployment_replicas
    selector {
      match_labels = {
        "app.kubernetes.io/name" = var.deployment_matchlabels
      }
    }

    template {
      metadata {
        labels = {
          "app.kubernetes.io/name" = var.deployment_matchlabels
        }
      }

      spec {
        container {
          image             = var.deployment_container_image
          image_pull_policy = "Always"
          name              = var.deployment_container_name
          port {
            container_port = var.deployment_container_port
            protocol       = var.deployment_container_protocol
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "service" {
  depends_on = [
    kubernetes_deployment.deployment
  ]

  metadata {
    name      = var.service_name
    namespace = var.namespace
  }

  spec {
    selector = {
      "app.kubernetes.io/name" = var.deployment_matchlabels
    }
    type = var.service_type

    port {
      port        = var.service_port
      protocol    = var.service_protocol
      target_port = var.deployment_container_port
    }
  }
}

resource "kubernetes_ingress_v1" "ingress" {
  depends_on = [
    kubernetes_service.service
  ]
  wait_for_load_balancer = true
  metadata {
    name      = var.ingress_name
    namespace = var.namespace
    annotations = {
      "alb.ingress.kubernetes.io/scheme"             = "internet-facing",
      "alb.ingress.kubernetes.io/target-type"        = "instance"
      "alb.ingress.kubernetes.io/load-balancer-name" = var.ingress_load_balancer_name
      "alb.ingress.kubernetes.io/group.name"         = "alb-group"
    }
  }

  spec {
    ingress_class_name = "alb"

    rule {
      http {
        path {
          path      = "/"
          path_type = "Prefix"

          backend {

            service {
              name = var.service_name

              port {
                number = var.service_port
              }
            }
          }
        }
      }
    }
  }
}
