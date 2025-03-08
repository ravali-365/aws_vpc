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

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public_assoc" {
  count          = 3
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_rt.id
}