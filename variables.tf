variable "subnet_id" {
  default = ""
}

variable "cloud9_image_id" {
  default = "ubuntu-18.04-x86_64"
}

variable "cloud9_instance_type" {
  default = "t3.small"
}

variable "cloud9_name" {
  default = "terraform-cloud9"
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
