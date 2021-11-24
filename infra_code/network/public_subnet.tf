resource "aws_subnet" "subnet1" {
  depends_on = [
    aws_vpc.custom
  ]

  vpc_id = aws_vpc.custom.id

  # IP Range of this subnet
  cidr_block = "172.20.10.0/24"

  # Data Center of this subnet.
  availability_zone = "ap-south-1a"

  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet"
    "Terraform" = "true"
  }
}

resource "aws_route_table_association" "RouteTable-Association" {

  depends_on = [
    aws_vpc.custom,
    aws_subnet.subnet1,
    aws_subnet.subnet2,
    aws_route_table.Public-Subnet-RT
  ]

# Public Subnet ID
  subnet_id      = aws_subnet.subnet1.id

#  Route Table ID
  route_table_id = aws_route_table.Public-Subnet-RT.id
}