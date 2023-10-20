locals {
  harness_secrets = {}
  kubernetes_connector = var.enable_harness_k8s_connector ? {
    for k, v in var.harness_platform_kubernetes_connectors : k => {
      description           = "terraform generated k8s connector"
      tags                  = var.tags
      project_id            = "" # harness project_id
      org_id                = "" # harness org_id
      delegate_selectors    = ["kubernetes-costos"]
      service_account       = try(v.service_account, {})
      username_password     = {}
      inherit_from_delegate = try(v.inherit_from_delegate, {})
    } if v.enable
  } : {}
  kubernetes_ccm_connector = var.enable_harness_ccm_connector ? {
    for k, v in var.harness_platform_kubernetes_connectors : k => {
      description        = "terraform generated k8s connector"
      tags               = var.tags
      project_id         = ""
      org_id             = ""
      delegate_selectors = ["kubernetes-costos"]
      features_enabled   = ["VISIBILITY", "OPTIMIZATION"]
    } if v.enable
  } : {}
}
