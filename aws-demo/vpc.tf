resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.project_name}-vpc"
  }
}

resource "aws_subnet" "web" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_cidrs["web"]
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.project_name}-web-subnet"
  }
}

resource "aws_subnet" "app" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidrs["app"]
  availability_zone = "${var.aws_region}b"
  tags = {
    Name = "${var.project_name}-app-subnet"
  }
}

resource "aws_subnet" "db" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidrs["db"]
  availability_zone = "${var.aws_region}c"
  tags = {
    Name = "${var.project_name}-db-subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.project_name}-igw"
  }
}
