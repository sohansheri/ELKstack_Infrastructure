# VPC and Subnet of ELK Stack project

### MAIN ELK VPC 
resource "aws_vpc" "elk_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}

### INTERNET GATEWAY FOR VPC
resource "aws_internet_gateway" "elk_vpc_igw" {
  vpc_id = aws_vpc.elk_vpc.id
  tags = {
    "Name" = "elk_vpc_igw"
  }
}

### KIBANA PUBLIC SUBNET 1 IN AZ a #
resource "aws_subnet" "kibana_public_subnet1" {
  vpc_id                  = aws_vpc.elk_vpc.id
  cidr_block              = var.kibanasub_public1_cidr
  availability_zone       = "eu-west-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "kibana_public_subnet1"
  }
}

### MONITORING PRIVATE SUBNET 1 IN AZ a 
resource "aws_subnet" "monitor_private_subnet1" {
  vpc_id            = aws_vpc.elk_vpc.id
  cidr_block        = var.monitorsub_private1_cidr
  availability_zone = "eu-west-1a"

  tags = {
    Name = "monitor_private_subnet1"
  }
}

###APPLICATION PRIVATE SUBNET 1 IN AZ a 
resource "aws_subnet" "app_private_subnet1" {
  vpc_id            = aws_vpc.elk_vpc.id
  cidr_block        = var.appsub_private1_cidr
  availability_zone = "eu-west-1a"

  tags = {
    Name = "app_private_subnet1"
  }
}
###APPLICATION PRIVATE SUBNET 1 IN AZ b #
resource "aws_subnet" "app_private_subnet2" {
  vpc_id            = aws_vpc.elk_vpc.id
  cidr_block        = var.appsub_private2_cidr
  availability_zone = "eu-west-1b"

  tags = {
    Name = "app_private_subnet2"
  }
}
###APPLICATION PRIVATE SUBNET 1 IN AZ c 
resource "aws_subnet" "app_private_subnet3" {
  vpc_id            = aws_vpc.elk_vpc.id
  cidr_block        = var.appsub_private3_cidr
  availability_zone = "eu-west-1c"

  tags = {
    Name = "app_private_subnet3"
  }
}


## E-IP FOR NAT GATEWAY #
resource "aws_eip" "ngw_eip" {
  vpc = true
  tags = {
    "Name" = "ngw_eip"
  }
}

### NAT GATEWAY IN KIBANA PUBLIC SUBNET 
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.ngw_eip.id
  subnet_id     = aws_subnet.kibana_public_subnet1.id

  tags = {
    Name = "elk_vpc_ngw"
  }
}


### ROUTE 53 DNS RESOLUTION #





