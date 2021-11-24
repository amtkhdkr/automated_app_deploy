resource "aws_eip" "Nat-Gateway-EIP" {
  depends_on = [
    aws_route_table_association.RouteTable-Association
  ]
  vpc = true
}