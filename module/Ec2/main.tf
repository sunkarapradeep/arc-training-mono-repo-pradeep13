# main.tf

provider "aws" {
  region = var.aws_region
}

# Security Group for EC2 instance in the Existing VPC
resource "aws_security_group" "ec2_sg" {
  name        = "${var.namespace}-${var.organisation}-${var.environment}-ec2-sg"
  description = "Security group for EC2 instance"
  vpc_id      =  "vpc-02e5b996079fe0361"# Link to the existing VPC

  tags = {
    Name = "${var.namespace}-${var.organisation}-${var.environment}-ec2-sg"
  }
}

# Security Group Rule for SSH
resource "aws_security_group_rule" "ec2_sg_ssh" {
  security_group_id = aws_security_group.ec2_sg.id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

# Security Group Rule for HTTP
resource "aws_security_group_rule" "ec2_sg_http" {
  security_group_id = aws_security_group.ec2_sg.id
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

# EC2 Instance
resource "aws_instance" "arc_ec2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = aws_key_pair.generated_key.key_name
  subnet_id              = data.aws_subnet.public.id
  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  
  root_block_device {
    volume_type           = var.root_volume_type
    volume_size           = var.root_volume_size
    delete_on_termination = true
  }

  ebs_block_device {
    device_name           = var.ebs_device_name
    volume_type           = var.ebs_volume_type
    volume_size           = var.ebs_volume_size
    encrypted             = var.ebs_encrypted
    delete_on_termination = true
  }

  disable_api_termination             = var.disable_api_termination
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior
  monitoring                         = var.monitoring

  credit_specification {
    cpu_credits = var.cpu_credits
  }

  ebs_optimized = var.ebs_optimized
  tenancy       = var.tenancy

  metadata_options {
    http_endpoint               = var.metadata_http_endpoint
    http_tokens                 = var.metadata_http_tokens
    http_put_response_hop_limit = var.metadata_http_put_response_hop_limit
  }

  user_data = var.user_data
}

# EC2 Key Pair
resource "aws_key_pair" "generated_key" {
  key_name   = var.key_name
  public_key = var.ssh_public_key
}


