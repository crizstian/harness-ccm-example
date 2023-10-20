variable "remote_state" {}
variable "kubernetes_host" {}
variable "kubernetes_token" {}
variable "harness_autostopping_token" {}
variable "k8s_connector_id" {}
variable "account_id" {
  default = "EYpEMytRR1m6qb0XSEw1-Q"
}
variable "enable_harness_k8s_connector" {
  default = false
}
variable "enable_harness_ccm_connector" {
  default = false
}
