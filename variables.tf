variable "subnet_id" {

}

variable "aws_region" {
  default = "us-east-2"
}

variable "app_tag" {
  default = "demo-app"
}

variable "owner_tag" {
  default = "demo-user"
}

variable "cloudflare_zone_id" {
  default = ""
}

variable "domain_name_label" {
  default = ""
}