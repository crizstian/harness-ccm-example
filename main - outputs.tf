output "clusters" {
  value = module.harness.kubernetes_cluster
}
output "clusters_details" {
  value = module.harness.kubernetes_cluster_details
}
output "clusters-ccm" {
  value = module.harness.kubernetes_cluster_cost
}
