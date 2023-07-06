resource "aws_vpc" "main" {

  cidr_block       = var.CIDR
  tags = {
    Name = terraform.workspace
  }
}

resource "aws_subnet" "public_subnet" {
  count             = length(var.availability_zone)
  vpc_id     = aws_vpc.main.id
  availability_zone = element(var.availability_zone,count.index)
  cidr_block = cidrsubnet(
    var.CIDR,
    ceil(log(length(var.availability_zone) * 2, 2)),
    count.index
  )
}


resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = terraform.workspace
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = terraform.workspace
  }
}