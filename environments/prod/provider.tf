terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.58.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.9.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.19.0"
    }
  }
}

provider "aws" {
  alias      = "AWS_REGION_US_WEST_1"
  region     = "us-west-1"
}

provider "aws" {
  alias      = "AWS_REGION_US_WEST_2"
  region     = "us-west-2"
}

provider "helm" {
  alias = "AWS_REGION_US_WEST_1"
  kubernetes {
    host                   = data.aws_eks_cluster.eks_cluster_us_west_1.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks_cluster_us_west_1.certificate_authority.0.data)
    exec {
      api_version = "client.authentication.k8s.io/v1"
      command     = "aws"
      args = [
        "eks",
        "get-token",
        "--cluster-name",
        data.aws_eks_cluster.eks_cluster_us_west_1.name,
      ]
    }
  }
}

provider "helm" {
  alias = "AWS_REGION_US_WEST_2"
  kubernetes {
    host                   = data.aws_eks_cluster.eks_cluster_us_west_2.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks_cluster_us_west_2.certificate_authority.0.data)
    exec {
      api_version = "client.authentication.k8s.io/v1"
      command     = "aws"
      args = [
        "eks",
        "get-token",
        "--cluster-name",
        data.aws_eks_cluster.eks_cluster_us_west_2.name,
      ]
    }
  }
}

provider "kubectl" {
  alias                  = "AWS_REGION_US_WEST_1"
  host                   = data.aws_eks_cluster.eks_cluster_us_west_1.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks_cluster_us_west_1.certificate_authority.0.data)
  exec {
    api_version = "client.authentication.k8s.io/v1alpha1"
    command     = "aws"
    args = [
      "eks",
      "get-token",
      "--cluster-name",
      data.aws_eks_cluster.eks_cluster_us_west_1.name,
    ]
  }
}

provider "kubectl" {
  alias                  = "AWS_REGION_US_WEST_2"
  host                   = data.aws_eks_cluster.eks_cluster_us_west_2.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks_cluster_us_west_2.certificate_authority.0.data)
  exec {
    api_version = "client.authentication.k8s.io/v1alpha1"
    command     = "aws"
    args = [
      "eks",
      "get-token",
      "--cluster-name",
      data.aws_eks_cluster.eks_cluster_us_west_2.name,
    ]
  }
}

provider "kubernetes" {
  alias                  = "AWS_REGION_US_WEST_1"
  host                   = data.aws_eks_cluster.eks_cluster_us_west_1.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks_cluster_us_west_1.certificate_authority.0.data)
  #token                  = data.aws_eks_cluster_auth.eks_cluster_us_west_1.token
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args        = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.eks_cluster_us_west_1.id]
  }
}

provider "kubernetes" {
  alias                  = "AWS_REGION_US_WEST_2"
  host                   = data.aws_eks_cluster.eks_cluster_us_west_2.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks_cluster_us_west_2.certificate_authority.0.data)
  # token                  = data.aws_eks_cluster_auth.eks_cluster_us_west_2.token
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args        = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.eks_cluster_us_west_2.id]
  }
}
