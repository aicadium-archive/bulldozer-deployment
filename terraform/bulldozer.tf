resource "helm_release" "bulldozer" {
  name       = var.release_name
  chart      = var.chart_name
  repository = var.chart_repository
  version    = var.chart_version
  namespace  = var.chart_namespace

  values = [
    local.rendered_values
  ]
}

data "vault_generic_secret" "bulldozer" {
  path = "bulldozer"
}

locals {
  rendered_values = templatefile("${path.module}/templates/bulldozer.template.yaml", local.values)

  values = {
    github_app_integration_id = "${data.vault_generic_secret.bulldozer.data["github_app_integration_id"]}"
    github_app_webhook_secret = "${data.vault_generic_secret.bulldozer.data["github_app_webhook_secret"]}"
    github_app_private_key_pem = "${data.vault_generic_secret.bulldozer.data["github_app_private_key_pem"]}"
  }
}

locals {
  rendered_values = templatefile("${path.module}/templates/values.yaml", local.values)

  values = {
    fullname_override = var.fullname_override != null ? jsonencode(var.fullname_override) : "null"

    image     = var.bulldozer_image_name
    image_tag = var.bulldozer_image_tag
    replicas  = var.replicas

    ingress_enabled = var.ingress_enabled
    ingress_host = var.ingress_host
  }
}
