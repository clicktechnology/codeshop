# Step 0. : Set variables for installation..

variable "author" { default = "Morgan Conlon" }
variable "contact_mail" { default = "morgan.conlon+github@click-technology.com" }
variable "aws_region" { default = "us-east-1" }
variable "aws_az" { default = "us-east-1a" }
variable "aws_access_key" {} # Extracted from environment variable TF_VAR_aws_access_key
variable "aws_secret_key" {} # Extracted from environment variable TF_VAR_aws_secret_key

variable "vpc_name" { default = "my-vpc" }
variable "public_subnet_name" { default = "my-public-subnet" }
variable "vpc_address_space" { default = "192.168.60.0/24" }
variable "vpc_public_subnet" { default = "192.168.60.0/25" }

# Uncomment below for matching private subnet
# variable "vpc_private_subnet" { default = "192.168.60.128/25" }