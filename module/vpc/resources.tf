resource "aws_vpc" "vpc1" {
    cidr_block = var.vpc_cidr
  tags = {
    Name = var.tag-of-vpc1
  }
}
resource "aws_subnet" "public1" {
    vpc_id = aws_vpc.vpc1.id
    cidr_block = var.public1-subnet
    map_public_ip_on_launch = true
  tags = {
    Name = var.tag-of-public1-subnet
  }  
}
resource "aws_subnet" "public2" {
    vpc_id = aws_vpc.vpc1.id
    cidr_block = var.public2-subnet
    map_public_ip_on_launch = true
  tags = {
    Name = var.tag-of-public2-subnet
  }
}
resource "aws_internet_gateway" "vpc1gw" {
    vpc_id = aws_vpc.vpc1.id
  tags = {
    Name = var.tag-of-internet-gateway 
  }
}
resource "aws_route_table" "public1rt" {
    vpc_id = aws_vpc.vpc1.id
    route {
        cidr_block = var.public1-rt
        gateway_id = aws_internet_gateway.vpc1gw.id
    }
    tags = {
        Name = var.tag-of-public1-rt
    }
}
resource "aws_route_table_association" "public1rta" {
    subnet_id = aws_subnet.public1.id
    route_table_id = aws_route_table.public1rt.id
}
resource "aws_route_table" "public2rt" {
    vpc_id = aws_vpc.vpc1.id
    route {
        cidr_block = var.public2-rt
        gateway_id = aws_internet_gateway.vpc1gw.id
    }
    tags = {
        Name = var.tag-of-public2-rt
    }
}
resource "aws_route_table_association" "public2rta" {
    subnet_id = aws_subnet.public2.id
    route_table_id = aws_route_table.public2rt.id
}