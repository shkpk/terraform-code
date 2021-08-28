#nat gateway

resource "aws_eip" "test_nat_gateway" {
    vpc = true

}

resource "aws_nat_gateway" "test_ngw" {
  allocation_id = aws_eip.test_nat_gateway.id
  subnet_id     = aws_subnet.subnet_public_1.id

  tags = {
    Name = "Test_NGW"
  }

  depends_on = [aws_internet_gateway.test_igw]
}

resource "aws_route_table" "test_ngw_rt" {
  vpc_id = aws_vpc.test_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.test_ngw.id
  }

  tags = {
    Name = "test NGW Routing Table"
  }
}

resource "aws_route_table_association" "test_ngw_rts_private_subnet_1" {
  subnet_id      = aws_subnet.subnet_private_1.id
  route_table_id = aws_route_table.test_ngw_rt.id
}

resource "aws_route_table_association" "test_ngw_rts_private_subnet_2" {
  subnet_id      = aws_subnet.subnet_private_2.id
  route_table_id = aws_route_table.test_ngw_rt.id
}

resource "aws_route_table_association" "test_ngw_rts_private_subnet_3" {
  subnet_id      = aws_subnet.subnet_private_3.id
  route_table_id = aws_route_table.test_ngw_rt.id
}