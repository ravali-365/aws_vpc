resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "public_subnet" {
  count                  = 3
  vpc_id                 = aws_vpc.my_vpc.id
  cidr_block             = var.public_subnets_cidr[count.index]
  map_public_ip_on_launch = true
}


resource "aws_subnet" "private_subnet" {
  count      = 3
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.private_subnets_cidr[count.index]
}