resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "PublicSubnet1"
  }
}

resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "PublicSubnet2"
  }
}

resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.10.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "PrivateSubnet1"
  }
}

resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.11.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "PrivateSubnet2"
  }
}

resource "aws_subnet" "private3" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.20.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "PrivateSubnet3"
  }
}

resource "aws_subnet" "private4" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.21.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "PrivateSubnet4"
  }
}
