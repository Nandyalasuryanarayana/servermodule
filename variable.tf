variable "instance_type" {
  type = string
  description = "type of architect vm"
}

variable "subnetid" {
 type = map(string)
}

variable "public_ip_address" {
  type = bool
}

variable "security" {
  type = list(string)
}

variable "root_block" {
  type = object({
    volumesize = string
    volumetype = string
  })
}

variable "aws_key_pair" {
  type = string
}




