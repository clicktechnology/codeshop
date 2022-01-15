# Step 4. : Set up VPC..

resource "aws_vpc" "my-vpc" {
  cidr_block           = var.vpc_address_space
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name    = "${var.vpc_name}"
    Contact = "${var.author}"
    Email   = "${var.contact_mail}"
  }
}