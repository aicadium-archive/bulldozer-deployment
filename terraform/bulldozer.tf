resource "helm_release" "bulldozer" {
  name       = var.release_name
  chart      = var.chart_name
  repository = var.chart_repository
  version    = var.chart_version

  values = [
    local.rendered_values
  ]
}

locals {
  rendered_values = templatefile("${path.module}/templates/values.template.yaml", local.values)

  values = {
    github_integration_id = var.bulldozer_github_integration_id
    github_webhook_secret = var.bulldozer_github_webhook_secret
    github_private_key_pem = var.bulldozer_github_private_key_pem

    image     = var.bulldozer_image_name
    image_tag = var.bulldozer_image_tag
    replicas  = var.replicas

    ingress_enabled = var.bulldozer_ingress_enabled
    ingress_host = var.bulldozer_ingress_host

    ingress_annotations = jsonencode(var.bulldozer_ingress_annotations)
  }
}
