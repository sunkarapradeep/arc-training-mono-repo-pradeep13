################################################
## imports
################################################
## vpc
/*data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["${var.namespace}-${var.environment}-vpc"]
  }
}

## network
data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
  filter {
    name = "tag:Name"
    values = [
      "*private*"
    ]
  }
}*/

################################################
## imports
################################################
## vpc
data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["arc-dev-vpc"] # Correct VPC name
  }
}

## network
data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
  filter {
    name = "tag:Name"
    values = [
      "arc-dev-private-subnet-private-us-east-1a", # Private subnet 1
      "arc-dev-private-subnet-private-us-east-1b"  # Private subnet 2
    ]
  }
}