module "harness" {
  source                   = "./modules/harness"
  kubernetes_connector     = local.kubernetes_connector
  kubernetes_ccm_connector = local.kubernetes_ccm_connector
}
