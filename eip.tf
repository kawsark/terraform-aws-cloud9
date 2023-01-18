data "aws_instance" "anycompany" {
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
  instance = data.aws_instance.anycompany.id
  vpc      = true
}

output "cloud9_public_ip" {
  value = aws_eip.cloud9_eip.public_ip
}