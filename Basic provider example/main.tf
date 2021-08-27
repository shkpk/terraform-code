resource "aws_instance" "firstone" {
  count         = 3
  ami           = "ami-0c2b8ca1dad447f8a"
  instance_type = "t2.micro"
  tags = {
    "name" = "demo-${count.index}"
  }
}