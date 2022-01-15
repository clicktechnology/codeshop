# Step 9. : Set up the Security group for SSH and ICMP..

resource "aws_security_group" "default-sg" {
  name        = "my-vpc-default-sg"
  description = "Allow ssh and ICMP to my-vpc"
  vpc_id      = aws_vpc.my-vpc.id
  depends_on  = [aws_vpc.my-vpc]
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    self      = "true"
  }
  tags = {
    Name    = "Default security group"
    Contact = "${var.author}"
    Email   = "${var.contact_mail}"
  }
}