# Step 6. : Create internet gateway called 'my-igw'..

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name    = "my_vpc > my_igw"
    Contact = "${var.author}"
    Email   = "${var.contact_mail}"
  }
}