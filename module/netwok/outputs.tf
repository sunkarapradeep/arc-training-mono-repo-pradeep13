# Output the VPC ID
output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.my_vpc.id
}

# Output the Public Subnet ID
output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = aws_subnet.public_subnet.id
}

# Output the Private Subnet ID
output "private_subnet_id" {
  description = "The ID of the private subnet"
  value       = aws_subnet.private_subnet.id
}

# Output the Elastic IP ID for the NAT Gateway
output "nat_eip_id" {
  description = "The ID of the Elastic IP allocated for the NAT Gateway"
  value       = aws_eip.nat_eip.id
}

# Output the NAT Gateway ID
output "nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  value       = aws_nat_gateway.nat_gateway.id
}

# Output the Internet Gateway ID
output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.my_igw.id
}

# Output the Public Route Table ID
output "public_route_table_id" {
  description = "The ID of the public route table"
  value       = aws_route_table.my_route_table.id
}

# Output the Private Route Table ID
output "private_route_table_id" {
  description = "The ID of the private route table"
  value       = aws_route_table.private_route_table.id
}

# Output the Route Table Association IDs for Public Subnet
output "public_route_table_assoc_id" {
  description = "The ID of the route table association for the public subnet"
  value       = aws_route_table_association.my_route_table_assoc.id
}

# Output the Route Table Association IDs for Private Subnet
output "private_route_table_assoc_id" {
  description = "The ID of the route table association for the private subnet"
  value       = aws_route_table_association.private_route_table_assoc.id
}
