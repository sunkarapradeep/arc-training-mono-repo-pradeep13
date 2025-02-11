terraform {
  required_version = "~> 1.3, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0, < 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Create VPC
resource "aws_vpc" "my_vpc" {
  cidr_block           = "10.0.0.0/16" # CIDR block for VPC
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "my-vpc"
  }
}


# Create Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id # Correct the reference
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true # Assign public IPs to instances

  tags = {
    Name = "public-subnet"
  }
}

# Create Private Subnet
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.my_vpc.id # Correct the reference
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "private-subnet"
  }
}

# Create Elastic IP for NAT Gateway
/*resource "aws_eip" "nat_eip" {
  vpc = true  # Enable VPC support for the EIP
}*/

resource "aws_eip" "nat_eip" {
  domain = "vpc" # Specify that the EIP is for VPC

  # No need to specify `vpc = true` anymore, use `domain = "vpc"`
}


# Create NAT Gateway
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet.id # Correct the reference

  tags = {
    Name = "nat-gateway"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id # Correct the reference

  tags = {
    Name = "my-igw"
  }
}

# Create Route Table for Public Subnet
resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id # Correct the reference

  route {
    cidr_block = "0.0.0.0/0"                    # Route all internet traffic
    gateway_id = aws_internet_gateway.my_igw.id # Correct the reference
  }

  tags = {
    Name = "my-route-table"
  }
}

# Associate Route Table with Public Subnet
resource "aws_route_table_association" "my_route_table_assoc" {
  subnet_id      = aws_subnet.public_subnet.id # Correct the reference to public subnet
  route_table_id = aws_route_table.my_route_table.id
}

# Create Route Table for Private Subnet (Optional, if private subnet needs internet access via NAT)
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"                    # Route all internet traffic
    nat_gateway_id = aws_nat_gateway.nat_gateway.id # Correct the reference to NAT Gateway
  }

  tags = {
    Name = "private-route-table"
  }
}

# Associate Route Table with Private Subnet
resource "aws_route_table_association" "private_route_table_assoc" {
  subnet_id      = aws_subnet.private_subnet.id # Correct the reference to private subnet
  route_table_id = aws_route_table.private_route_table.id
}