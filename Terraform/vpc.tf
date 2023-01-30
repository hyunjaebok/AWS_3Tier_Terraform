# VPC
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "awesome-vpc"
  }
}

# IGW
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "awesome-igw"
  }
}

/*# 탄력적 IP (pub_a)
resource "aws_eip" "pub_a" {
  vpc = true

  tags = {
    Name = "awesome-eip-ap-northeast-2a"
  }
}

# 탄력적 IP (pub_c)
resource "aws_eip" "pub_c" {
  vpc = true

  tags = {
    Name = "awesome-eip-ap-northeast-2c"
  }
}

# NAT GW (pub_a)
resource "aws_nat_gateway" "gw_a" {
  allocation_id = aws_eip.pub_a.id
  subnet_id     = aws_subnet.pub_a.id

  tags = {
    Name = "awesome-nat-public1-ap-northeast-2a"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}

# NAT GW (pub_c)
resource "aws_nat_gateway" "gw_c" {
  allocation_id = aws_eip.pub_c.id
  subnet_id     = aws_subnet.pub_c.id

  tags = {
    Name = "awesome-nat-public2-ap-northeast-2c"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}*/

# public_routing_table
resource "aws_route_table" "rtb_pub" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "awesome-rtb_public"
  }
}

# public_subnets & public_routing_table association
resource "aws_route_table_association" "ass_pub_a" {
  subnet_id      = aws_subnet.sub_pub_a.id
  route_table_id = aws_route_table.rtb_pub.id
}

resource "aws_route_table_association" "ass_pub_c" {
  subnet_id      = aws_subnet.sub_pub_c.id
  route_table_id = aws_route_table.rtb_pub.id
}

# private_routing_tabless
resource "aws_route_table" "rtb_pri_a" {
  vpc_id = aws_vpc.main.id

  /*  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.gw_a.id
  }*/

  tags = {
    Name = "awesome-rbt-private1-ap-northeast-2a"
  }
}

resource "aws_route_table" "rtb_pri_c" {
  vpc_id = aws_vpc.main.id

  /*  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.gw_c.id
  }*/

  tags = {
    Name = "awesome-rbt-private2-ap-northeast-2c"
  }
}

# private_subnets & private_routing_table association
resource "aws_route_table_association" "ass_pri_web_a" {
  subnet_id      = aws_subnet.sub_web_a.id
  route_table_id = aws_route_table.rtb_pri_a.id
}

resource "aws_route_table_association" "ass_pri_web_c" {
  subnet_id      = aws_subnet.sub_web_c.id
  route_table_id = aws_route_table.rtb_pri_c.id
}

resource "aws_route_table_association" "ass_pri_was_a" {
  subnet_id      = aws_subnet.sub_was_a.id
  route_table_id = aws_route_table.rtb_pri_a.id
}

resource "aws_route_table_association" "ass_pri_was_b" {
  subnet_id      = aws_subnet.sub_was_c.id
  route_table_id = aws_route_table.rtb_pri_c.id
}

resource "aws_route_table_association" "ass_pri_db_a" {
  subnet_id      = aws_subnet.sub_db_a.id
  route_table_id = aws_route_table.rtb_pri_a.id
}

resource "aws_route_table_association" "ass_pri_db_c" {
  subnet_id      = aws_subnet.sub_db_c.id
  route_table_id = aws_route_table.rtb_pri_c.id

}

