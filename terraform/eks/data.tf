# TODO: refactor so this doesn't get copy/pasted
###############################################
## imports
################################################
## network
/*data "aws_vpc" "arc-poc-vpc" {
  filter {
    name   = "tag:Name"
    values = ["arc-dev-vpc"]#["${var.arc}-${var.poc}-vpc"]
  }
}

## network
data "aws_subnets" "private" {
  filter {
    name = "tag:Name"

    values = [
      #"${var.namespace}-${var.environment}-private-subnet-private-${var.region}a",
      #"${var.namespace}-${var.environment}-private-subnet-private-${var.region}b"
      #"${var.arc}-${var.dev}-private-subnet-private-${var.region}a",
      #"${var.arc}-${var.dev}-private-subnet-private-${var.region}b"
        "arc-dev-private-subnet-private-us-east-1a",
        "arc-dev-private-subnet-private-us-east-1b"
    ]
  }
}


## security
/*data "aws_security_groups" "db_sg" {
  filter {
    name   = "group-name"
    values = ["${var.namespace}-${var.environment}-db-sg"]
  }

  filter {
    name   = "vpc-id"
    values = ["arc-dev-vpc"]#[data.aws_vpc.arc-poc-vpc]
  }
}*/

/*data "aws_security_groups" "db_sg" {
  filter {
    name   = "group-name"
    values = ["${var.namespace}-${var.environment}-db-sg"]
  }

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.arc-poc-vpc.id]  # Use the dynamic VPC ID here
  }
}


data "aws_security_groups" "eks_sg" {
  filter {
    name   = "group-name"
    values = ["${var.namespace}-${var.environment}-eks-sg"]
  }

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.arc-poc-vpc.id]
  }
}

data "aws_eks_cluster" "eks" {
  name = module.eks_cluster.eks_cluster_id
}

data "aws_eks_cluster_auth" "eks" {
  name = module.eks_cluster.eks_cluster_id
}*/

# TODO: refactor so this doesn't get copy/pasted
###############################################
## imports
################################################
data "aws_eks_cluster" "cluster" {
  name = module.eks_cluster.eks_cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks_cluster.eks_cluster_id
}
## network
data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    #values = ["${var.namespace}-${var.environment}-vpc"]
    values = ["arc-dev-vpc"]
  }
}

## network
data "aws_subnets" "private" {
  filter {
    name   = "tag:Name"
    values = [
      #"${var.namespace}-${var.environment}-private-subnet-private-use1a",
      #"${var.namespace}-${var.environment}-private-subnet-private-use1b"
      "arc-dev-private-subnet-private-us-east-1a",
        "arc-dev-private-subnet-private-us-east-1b"
    ]
  }
}