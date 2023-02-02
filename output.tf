output "cloud9_instance_id" {
  value = data.aws_instance.anycompany[0].id
}
