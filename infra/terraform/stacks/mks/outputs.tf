output "kubeconfig" {
  value = module.mks.kubeconfig
  sensitive = true
}