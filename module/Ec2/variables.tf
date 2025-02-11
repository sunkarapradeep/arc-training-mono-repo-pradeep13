# variables.tf

variable "aws_region" {
  description = "The AWS region to deploy the EC2 instance"
  type        = string
}

variable "ami" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
}

variable "namespace" {
  description = "The namespace for resource naming"
  type        = string
}

variable "organisation" {
  description = "The organisation name for resource naming"
  type        = string
}

variable "environment" {
  description = "The environment (dev, staging, prod)"
  type        = string
}

variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address with the instance"
  type        = bool
}

variable "root_volume_type" {
  description = "Root volume type"
  type        = string
}

variable "root_volume_size" {
  description = "Root volume size in GiB"
  type        = number
}

variable "ebs_device_name" {
  description = "Device name for the EBS volume"
  type        = string
}

variable "ebs_volume_type" {
  description = "EBS volume type"
  type        = string
}

variable "ebs_volume_size" {
  description = "Size of the EBS volume in GiB"
  type        = number
}

variable "ebs_encrypted" {
  description = "Whether the EBS volume is encrypted"
  type        = bool
}

variable "disable_api_termination" {
  description = "Whether to disable API termination for the instance"
  type        = bool
}

variable "instance_initiated_shutdown_behavior" {
  description = "Shutdown behavior of the instance"
  type        = string
}

variable "monitoring" {
  description = "Whether to enable CloudWatch monitoring"
  type        = bool
}

variable "cpu_credits" {
  description = "CPU credit option for burstable instance types"
  type        = string
}

variable "ebs_optimized" {
  description = "Whether the instance is EBS optimized"
  type        = bool
}

variable "tenancy" {
  description = "The tenancy of the instance (default or dedicated)"
  type        = string
}

variable "metadata_http_endpoint" {
  description = "Metadata HTTP endpoint setting"
  type        = string
}

variable "metadata_http_tokens" {
  description = "Metadata HTTP tokens setting"
  type        = string
}

variable "metadata_http_put_response_hop_limit" {
  description = "HTTP put response hop limit"
  type        = number
}

variable "user_data" {
  description = "User data for the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "The SSH key pair name"
  type        = string
}

variable "ssh_public_key" {
  description = "The SSH public key to be used for the EC2 instance"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID to launch the instance in"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID to launch the instance in"
  type        = string
}
