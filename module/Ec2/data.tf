# data.tf

data "aws_vpc" "vpc" {
  id = var.vpc_id  # Reference the VPC ID from variables or terraform.tfvars
}

data "aws_subnet" "public" {
  id = var.subnet_id  # Reference the Subnet ID from variables or terraform.tfvars
}
