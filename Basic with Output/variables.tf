variable "aws_profile" {
  type    = string
  default = "default"
}


variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "ec2_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ec2_name" {
  type    = string
  default = "testing"

}
