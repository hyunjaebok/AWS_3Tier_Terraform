# ALB_security_group
resource "aws_security_group" "alb" {
  name        = "awesome-ap2-web-alb-sg"
  description = "Allow HTTP inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "awesome-ap2-web-alb-sg"
  }
}

# WEB_security_group
resource "aws_security_group" "web" {
  name        = "awesome-ap2-web-sg"
  description = "Allow HTTP_SSH inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "HTTP from VPC"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb.id]
  }

  ingress {
    description     = "SSH from VPC"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.alb.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "awesome-ap2-web-sg"
  }
}

# WAS_security_group
resource "aws_security_group" "was" {
  name        = "awesome-ap2-was-sg"
  description = "Allow modjk_SSH inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "modjk from VPC"
    from_port   = 8009
    to_port     = 8009
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "awesome-ap2-was-sg"
  }
}

# DB_security_group
resource "aws_security_group" "db" {
  name        = "awesome-ap2-db-sg"
  description = "Allow db inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "DB from VPC"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.was.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "awesome-ap2-db-sg"
  }
}

# img_security_group
resource "aws_security_group" "img" {
  name        = "awesome-ap2-img-sg"
  description = "Allow all inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "all from VPC"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "awesome-ap2-img-sg"
  }
}