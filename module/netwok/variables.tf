variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "subnet_cidrs" {
  description = "List of CIDR blocks for subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of Availability Zones for the subnets"
  type        = list(string)
}

variable "map_public_ip_on_launch" {
  description = "Whether to assign public IPs to instances launched in the subnet"
  type        = list(bool)
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}