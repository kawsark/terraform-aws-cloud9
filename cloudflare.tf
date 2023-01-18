locals {
  create_cloudflare_record = length(var.cloudflare_zone_id) > 0
}

# Add the server record to domain
resource "cloudflare_record" "cloud9dns" {
  count   = local.create_cloudflare_record == true ? 1 : 0
  zone_id = var.cloudflare_zone_id
  name    = var.domain_name_label
  value   = aws_eip.cloud9_eip.public_ip
  type    = "A"
  ttl     = 1
}
