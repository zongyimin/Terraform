resource "aws_vpc" "my_vpc" {
  cidr_block = "192.168.0.0/16"
  tags = {
    Name = "my_vpc"
  }
}

resource "aws_subnet" "my_subnet-public-1" {
  cidr_block        = "192.168.1.0/24"
  vpc_id            = aws_vpc.my_vpc.id
  availability_zone = "ap-northeast-1a"
  tags = {
    Name = "my_subnet-public-1"
  }
}

resource "aws_subnet" "my_subnet-public-2" {
  cidr_block        = "192.168.2.0/24"
  vpc_id            = aws_vpc.my_vpc.id
  availability_zone = "ap-northeast-1c"
  tags = {
    Name = "my_subnet-public-2"
  }
}

resource "aws_subnet" "my_subnet-public-3" {
  cidr_block        = "192.168.3.0/24"
  vpc_id            = aws_vpc.my_vpc.id
  availability_zone = "ap-northeast-1d"
  tags = {
    Name = "my_subnet-public-3"
  }
}

resource "aws_subnet" "my_subnet-private-1" {
  cidr_block        = "192.168.4.0/24"
  vpc_id            = aws_vpc.my_vpc.id
  availability_zone = "ap-northeast-1a"
  tags = {
    Name = "my_subnet-private-1"
  }
}

resource "aws_subnet" "my_subnet-private-2" {
  cidr_block        = "192.168.5.0/24"
  vpc_id            = aws_vpc.my_vpc.id
  availability_zone = "ap-northeast-1c"
  tags = {
    Name = "my_subnet-private-2"
  }
}

resource "aws_subnet" "my_subnet-private-3" {
  cidr_block        = "192.168.6.0/24"
  vpc_id            = aws_vpc.my_vpc.id
  availability_zone = "ap-northeast-1d"
  tags = {
    Name = "my_subnet-private-3"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "gw"
  }
}

resource "aws_route_table" "table" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "New_table"
  }
}


resource "aws_main_route_table_association" "route_attach_subnet" {
  route_table_id = aws_route_table.table.id
  vpc_id         = aws_vpc.my_vpc.id

}
