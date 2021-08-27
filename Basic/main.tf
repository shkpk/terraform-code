provider "aws" {
  profile = "default"
  region  = "us-east-1"
}
resource "aws_instance" "firstone" {
  ami           = "ami-0c2b8ca1dad447f8a"
  instance_type = "t2.micro"
}