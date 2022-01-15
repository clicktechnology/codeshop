# Step 5. : Create a public subnet called 'my-public-subnet'..

resource "aws_subnet" "my-public-subnet" {
  vpc_id                  = aws_vpc.my-vpc.id
  cidr_block              = var.vpc_public_subnet
  availability_zone       = var.aws_az
  map_public_ip_on_launch = true

  tags = {
    Name    = "my-public-subnet"
    Contact = "${var.author}"
    Email   = "${var.contact_mail}"
  }
}
