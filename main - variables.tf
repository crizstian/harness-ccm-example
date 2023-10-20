variable "remote_state" {}

variable "tags" {
  default = ["Harness-Cloud-Cost-Management"]
}

variable "enable_harness_k8s_connector" {
  default = false
}
variable "enable_harness_ccm_connector" {
  default = false
}
variable "harness_platform_kubernetes_connectors" {
  default = {}
}
