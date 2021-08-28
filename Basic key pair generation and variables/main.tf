resource "aws_key_pair" "ec2_ssh_key" {
  key_name   = "ec2_ssh_key"
  public_key = file(var.path_to_pub_file)

}
resource "aws_instance" "firstinstance" {
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type
  key_name      = aws_key_pair.ec2_ssh_key.key_name
  tags = {
    "name" = "demo-${var.ec2_name}"
  }
}