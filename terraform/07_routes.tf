# Step 8. : Set up the Routing table for the public subnet..

resource "aws_route_table" "my_vpc_route_table" {
  vpc_id = aws_vpc.my-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name    = "my_vpc_default_route"
    Contact = "${var.author}"
    Email   = "${var.contact_mail}"
  }
}

resource "aws_route_table_association" "my_vpc_route_table" {
  subnet_id      = aws_subnet.my-public-subnet.id
  route_table_id = aws_route_table.my_vpc_route_table.id
}