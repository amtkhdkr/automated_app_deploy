resource "aws_internet_gateway" "Internet_Gateway" {
  depends_on = [
    aws_vpc.custom,
    aws_subnet.subnet1,
    aws_subnet.subnet2
  ]

  vpc_id = aws_vpc.custom.id

  tags = {
    Name = "InternetGateway-Custom"
    "Terraform" = "true"
  }
}