data "aws_availability_zones" "az_name" {}
data "aws_ami" "latest_ubuntu" {
  owners      = ["099720109477"]
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

resource "aws_key_pair" "ec2_ssh_key" {
  key_name   = "ec2_ssh_key"
  public_key = file(var.path_to_pub_file)

}

resource "aws_instance" "firstinstance" {
  ami               = data.aws_ami.latest_ubuntu.id
  instance_type     = var.ec2_instance_type
  availability_zone = data.aws_availability_zones.az_name.names[0]
  subnet_id = aws_subnet.subnet_public_1.id
  vpc_security_group_ids = [ aws_security_group.sg-custom_us_east.id ]
  key_name      = aws_key_pair.ec2_ssh_key.key_name

  tags = {
    "name" = "demo-${var.ec2_name}"
  }
}