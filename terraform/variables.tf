variable "bulldozer_image_name" {
  description = "Image name for the bot image"
  default = "palantirtechnologies/bulldozer"
}

variable "bulldozer_image_tag" {
  description = "Image tag for the bot image"
  default = "1.7.0"
}

variable "replicas" {
  description = "Replica count for the bot"
  default = 1
}

variable "ingress_enabled" {
  description = "Whether ingress is enabled"
  default = false
}

variable "ingress_host" {
  description = "Ingress host name"
  default = "chart-example.local"
}
