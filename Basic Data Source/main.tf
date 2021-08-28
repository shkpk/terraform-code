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

resource "aws_instance" "firstinstance" {
  ami               = data.aws_ami.latest_ubuntu.id
  instance_type     = var.ec2_instance_type
  availability_zone = data.aws_availability_zones.az_name.names[0]
  tags = {
    "name" = "demo-${var.ec2_name}"
  }
}