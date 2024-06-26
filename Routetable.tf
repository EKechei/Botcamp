resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "PublicRouteTable"
  }
}

resource "aws_route" "route" {
  route_table_id            = aws_route_table.rt.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "routetableassociation1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "routetableassociation2" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.rt.id
}
