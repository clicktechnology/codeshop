# Step 1. : Set up AWS providers..

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.70.0"
    }
  }
  backend "s3" {
    bucket         = "my-tf-state-239854"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "my-tf-lock"
  }
}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}