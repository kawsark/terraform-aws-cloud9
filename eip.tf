data "aws_instance" "anycompany" {
  count   = local.create_cloudflare_record == true ? 1 : 0
  filter {
    name = "tag:app"
    values = [
    var.app_tag]
  }

  filter {
    name = "tag:owner"
    values = [
    var.owner_tag]
  }
}

resource "aws_eip" "cloud9_eip" {
  count   = local.create_cloudflare_record == true ? 1 : 0
  instance = data.aws_instance.anycompany[0].id
  vpc      = true
}

output "cloud9_public_ip" {
  value = local.create_cloudflare_record == true ? "aws_eip.cloud9_eip[0].public_ip" : "none"
}