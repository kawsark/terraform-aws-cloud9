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
  instance_type               = "m5.xlarge"
  name                        = "anycompany-dev"
  automatic_stop_time_minutes = 60
  connection_type             = "CONNECT_SSH"
  description                 = "Dev workstation for anycompany"
  image_id                    = "ubuntu-18.04-x86_64"
  subnet_id                   = var.subnet_id
  tags = {
    app   = var.app_tag
    owner = var.owner_tag
  }
}
