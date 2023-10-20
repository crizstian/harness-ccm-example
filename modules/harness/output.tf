output "kubernetes_cluster_details" {
  value = { for k, v in harness_platform_connector_kubernetes.connector : v.name => {
    identifier     = "account.${v.identifier}"
    host           = try(var.kubernetes_connector[k].service_account.credentials.master_url, "")
    token_ref      = try(var.kubernetes_connector[k].service_account.credentials.service_account_token_ref, "")
    cost_connector = harness_platform_connector_kubernetes_cloud_cost.connector[k].identifier
  } }
}
output "kubernetes_cluster_cost" {
  value = { for k, v in harness_platform_connector_kubernetes_cloud_cost.connector : v.name => "account.${v.identifier}" }
}
output "kubernetes_cluster" {
  value = [for k, v in harness_platform_connector_kubernetes.connector : v.name]
}
