output "kubeconfig" {
  value = ovh_cloud_project_kube.default.kubeconfig
  sensitive = true
}