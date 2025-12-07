data "aws_ami" "ubuntu_22" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}


resource "aws_key_pair" "public_key" {
  public_key = var.aws_key_pair
}

resource "aws_instance" "ubuntu" {
  ami           = data.aws_ami.ubuntu_22.id
  instance_type = var.instance_type
  key_name = aws_key_pair.public_key.id
  associate_public_ip_address = var.public_ip_address
  subnet_id= var.subnetid
  security_groups = var.security
  root_block_device {
    volume_type = var.root_block.volumetype
    volume_size = var.root_block.volumesize
  }
  user_data_base64 = base64encode(var.user_data)
}


