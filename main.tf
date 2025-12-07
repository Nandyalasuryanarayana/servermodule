data "aws_ssm_parameter" "ubuntu_22" {
  name = "/aws/service/canonical/ubuntu/server/22.04/stable/current/amd64/hvm/ebs-gp3/ami-id"
}

resource "aws_key_pair" "public_key" {
  public_key = var.aws_key_pair
}

resource "aws_instance" "ubuntu" {
  ami           = data.aws_ssm_parameter.ubuntu_22.value
  instance_type = var.instance_type
  key_name = aws_key_pair.public_key.id
  associate_public_ip_address = var.public_ip_address
  for_each = var.subnetid
  subnet_id = each.value
  security_groups = var.security
  root_block_device {
    volume_type = var.root_block_device.volumetype
    volume_size = var.root_block_device.volumesize
  }
}


