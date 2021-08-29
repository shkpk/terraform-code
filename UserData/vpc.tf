#vps creation

resource "aws_vpc" "test_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "test_vpc"
  }
}

resource "aws_subnet" "subnet_public_1" {
  vpc_id     = aws_vpc.test_vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "Subnet_public_1"
  }
}

resource "aws_subnet" "subnet_public_2" {
  vpc_id     = aws_vpc.test_vpc.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "Subnet_public_2"
  }
}

resource "aws_subnet" "subnet_public_3" {
  vpc_id     = aws_vpc.test_vpc.id
  cidr_block = "10.0.3.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "Subnet_public_3"
  }
}

resource "aws_subnet" "subnet_private_1" {
  vpc_id     = aws_vpc.test_vpc.id
  cidr_block = "10.0.4.0/24"
  map_public_ip_on_launch = false

  tags = {
    Name = "Subnet_private_1"
  }
}

resource "aws_subnet" "subnet_private_2" {
  vpc_id     = aws_vpc.test_vpc.id
  cidr_block = "10.0.5.0/24"
  map_public_ip_on_launch = false

  tags = {
    Name = "Subnet_private_2"
  }
}

resource "aws_subnet" "subnet_private_3" {
  vpc_id     = aws_vpc.test_vpc.id
  cidr_block = "10.0.6.0/24"
  map_public_ip_on_launch = false

  tags = {
    Name = "Subnet_private_3"
  }
}

resource "aws_internet_gateway" "test_igw" {
  vpc_id = aws_vpc.test_vpc.id

  tags = {
    Name = "Test_IGW"
  }
}

resource "aws_route_table" "test_igw_rt" {
  vpc_id = aws_vpc.test_vpc.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.test_igw.id
    }

  tags = {
    Name = "test_igw_rt"
  }
}

resource "aws_route_table_association" "test_igw_rta_public_subnet_1" {
  subnet_id      = aws_subnet.subnet_public_1.id
  route_table_id = aws_route_table.test_igw_rt.id
}

resource "aws_route_table_association" "test_igw_rta_public_subnet_2" {
  subnet_id      = aws_subnet.subnet_public_2.id
  route_table_id = aws_route_table.test_igw_rt.id
}

resource "aws_route_table_association" "test_igw_rta_public_subnet_3" {
  subnet_id      = aws_subnet.subnet_public_3.id
  route_table_id = aws_route_table.test_igw_rt.id
}

