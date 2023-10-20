/* data "http" "manifest" {
  url = "https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/high-availability-1.21+.yaml"

  # Optional request headers
  request_headers = {
    Accept = "application/yaml"
  }
}

locals {
  yamls = [for data in split("---", data.http.manifest.response_body) : yamldecode(data)]
}

resource "kubernetes_manifest" "metrics-server" {
  count    = length(local.yamls)
  manifest = local.yamls[count.index]
} */

resource "kubernetes_manifest" "autostoppping-crd" {
  manifest = yamldecode(file("./manifiestos/autostoppping-crd.yml"))
}

/* resource "helm_release" "metrics_server" {
  name       = "metrics-server"
  repository = "https://kubernetes-sigs.github.io/metrics-server/"
  chart      = "metrics-server"
  version    = "3.11"
  namespace  = "kube-system"
  set {
    name  = "args"
    value = "{--kubelet-insecure-tls=true}"
  }

  # Wait for the release to be deployed
  wait = true
} */

data "kubernetes_service_v1" "metrics_server" {
  count = strcontains(terraform.workspace, "anthos") ? 0 : 1
  metadata {
    name      = "metrics-server"
    namespace = "kube-system"
  }
}
