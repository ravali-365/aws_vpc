output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "public_subnets" {
  value = aws_subnet.public_subnet[*].id
}

output "private_subnets" {
  value = aws_subnet.private_subnet[*].id
}

output "web_server_public_ip" {
  value = aws_instance.web_server.public_ip
}
