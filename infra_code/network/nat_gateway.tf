resource "aws_nat_gateway" "NAT_GATEWAY" {
  depends_on = [
    aws_eip.Nat-Gateway-EIP
  ]

  allocation_id = aws_eip.Nat-Gateway-EIP.id

  subnet_id = aws_subnet.subnet1.id
  tags = {
    Name = "Nat-Gateway_Project"
    "Terraform" = "true"
  }
}

resource "aws_route_table" "NAT-Gateway-RT" {
  depends_on = [
    aws_nat_gateway.NAT_GATEWAY
  ]

  vpc_id = aws_vpc.custom.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.NAT_GATEWAY.id
  }

  tags = {
    Name = "Route Table for NAT Gateway"
    "Terraform" = "true"
  }
}

resource "aws_route_table_association" "Nat-Gateway-RT-Association" {
  depends_on = [
    aws_route_table.NAT-Gateway-RT
  ]

  subnet_id      = aws_subnet.subnet2.id

  route_table_id = aws_route_table.NAT-Gateway-RT.id

  tags = {
    Name = "Route Table Association for NAT Gateway"
    "Terraform" = "true"
  }

}