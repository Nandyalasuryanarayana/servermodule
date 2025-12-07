output "instanceid" {
  value = {
    for k , id in aws_instance.ubuntu:
    k => id
  }
}