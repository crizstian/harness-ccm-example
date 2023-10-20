terraform {
  backend "gcs" {}
  required_providers {
    harness = {
      source = "harness/harness"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
    helm = {
      source = "hashicorp/helm"
    }
    http = {
      source = "hashicorp/http"
    }
  }
}

provider "kubernetes" {
  host     = var.kubernetes_host
  token    = var.kubernetes_token
  insecure = true
}

provider "helm" {
  kubernetes {
    host     = var.kubernetes_host
    token    = var.kubernetes_token
    insecure = true
  }
}
