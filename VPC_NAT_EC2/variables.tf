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

variable "path_to_pub_file" {
  default = "ec2.pub"

}

variable "path_to_private_file" {
  default = "ec2"

}