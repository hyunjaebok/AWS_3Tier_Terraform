# public_subnets
resource "aws_subnet" "sub_pub_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-northeast-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "awesome-subnet-public1-ap-northeast-2a"
  }
}

resource "aws_subnet" "sub_pub_c" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-northeast-2c"
  map_public_ip_on_launch = true

  tags = {
    Name = "awesome-subnet-public2-ap-northeast-2c"
  }
}

# private_subnets
resource "aws_subnet" "sub_web_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.11.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "awesome-subnet-private1-ap-northeast-2a"
  }
}

resource "aws_subnet" "sub_web_c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.21.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "awesome-subnet-private2-ap-northeast-2c"
  }
}

resource "aws_subnet" "sub_was_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.12.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "awesome-subnet-private3-ap-northeast-2a"
  }
}

resource "aws_subnet" "sub_was_c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.22.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "awesome-subnet-private4-ap-northeast-2c"
  }
}

resource "aws_subnet" "sub_db_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.13.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "awesome-subnet-private5-ap-northeast-2a"
  }
}

resource "aws_subnet" "sub_db_c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.23.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "awesome-subnet-private6-ap-northeast-2c"
  }
}