resource "aws_subnet" "subnet2" {
  depends_on = [
    aws_vpc.custom,
    aws_subnet.subnet1
  ]

  vpc_id = aws_vpc.custom.id

  # IP Range of this subnet
  cidr_block = "172.20.20.0/24"

  # Data Center of this subnet.
  availability_zone = "ap-south-1b"

  tags = {
    Name = "Private Subnet"
    "Terraform" = "true"
  }
}