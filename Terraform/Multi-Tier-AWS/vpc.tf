## Adding AWS as Provider
provider "aws" {
    access_key = var.access_key
    secret_key = var.secret_key
    region     = var.region  
}

## Creating VPC with CIDR and tags
resource "aws_vpc" "myvpc" {
    cidr_block = var.vpc_cidr
    enable_dns_hostnames = true
    tags = {
        Name = "Terraform"
    }
  }

## Adding Internet Gateway
resource "aws_internet_gateway" "default" {
    vpc_id = aws_vpc.myvpc.id
  }

##Adding public subnet
resource "aws_subnet" "public" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.public_subnet_cidr
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true
    depends_on = ["aws_internet_gateway.default"]
    tags = {
        Name = "Public"
    }
  }

##Creating route table
resource "aws_route_table" "public" {
    vpc_id = aws_vpc.myvpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.default.id
    }
  }

##Associating Route Table
resource "aws_route_table_association" "public" {
  subnet_id = aws_subnet.public.id
  route_table_id  = aws_route_table.public.id
}

##NAT Gateway creation
resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.elasticip.id
  subnet_id = aws_subnet.public.id
  }

## Create Private Subnet
resource "aws_subnet" "private" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = var.private_subnet_cidr
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = false
  depends_on = ["aws_nat_gateway.natgw"]
}

## Create Private Subnet Route Table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.natgw.id
  }  
}

## Associate Private RT to Private subnet
resource "aws_route_table_association" "private" {
  subnet_id = aws_subnet.private.id
  route_table_id = aws_route_table.private.id  
}

resource "aws_eip" "elasticip" {
  vpc = true  
}
