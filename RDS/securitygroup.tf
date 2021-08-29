resource "aws_security_group" "sg-custom_us_east" {
    name = "custom_us_east"
    vpc_id = aws_vpc.test_vpc.id

    ingress {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "Allow SSH from public"
      from_port = 22
      protocol = "tcp"
      to_port = 22
    }

    ingress {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "Allow http traffic"
      from_port = 80
      protocol = "tcp"
      to_port = 80
    }

    egress {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "Allow all outgoing traffic"
      from_port = 0
      protocol = "-1"
      to_port = 0
    }

    tags = {
        Name = "Test SG"
    }
}


resource "aws_security_group" "allow_mariadb" {
    name = "allow_mariadb"
    vpc_id = aws_vpc.test_vpc.id

    ingress {
      description = "Allow mysql connection"
      from_port = 3306
      protocol = "tcp"
      to_port = 3306
      security_groups = [ aws_security_group.sg-custom_us_east.id ]
    }

    egress {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "Allow all outgoing traffic"
      from_port = 0
      protocol = "-1"
      to_port = 0
    }

    tags = {
        Name = "RDS SG"
    }
}