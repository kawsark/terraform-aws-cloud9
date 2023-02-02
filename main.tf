terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_cloud9_environment_ec2" "anycompany" {
  instance_type               = var.cloud9_instance_type
  name                        = var.cloud9_name
  automatic_stop_time_minutes = 60
  connection_type             = "CONNECT_SSH"
  description                 = "Dev workstation for anycompany"
  image_id                    = var.cloud9_image_id
  subnet_id                   = length(var.subnet_id) > 0 ? var.subnet_id : null
  tags = {
    app   = var.app_tag
    owner = var.owner_tag
  }
}
