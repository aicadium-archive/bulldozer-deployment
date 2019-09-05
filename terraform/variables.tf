variable "bulldozer_image_name" {
  description = "Image name for the bot image"
  default = "palantirtechnologies/bulldozer"
}

variable "bulldozer_image_tag" {
  description = "Image tag for the bot image"
  default = "1.7.0"
}

variable "bulldozer_release_name" {
  description = "Release name"
  default = "bulldozer"
}

variable "bulldozer_chart_name" {
  description = "Name of the chart to use"
}

variable "bulldozer_chart_version" {
  description = "Version of the chart"
}

variable "bulldozer_chart_repository" {
  description = "Repository holding the chart"
}

variable "replicas" {
  description = "Replica count for the bot"
  default = 1
}

variable "ingress_enabled" {
  description = "Whether ingress is enabled"
  default = false
}

variable "ingress_annotations" {
  description = "Annotation for ingress object"
  default = {}
}

variable "ingress_host" {
  description = "Ingress host name"
}
