output "instanceid" {
  value = {
    for k , id in aaws_instance.ubuntu:
    k => id
  }
}