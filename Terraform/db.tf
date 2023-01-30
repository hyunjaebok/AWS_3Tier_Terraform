# DB_subnet_group
resource "aws_db_subnet_group" "db_sg" {
  name       = "db-sg"
  subnet_ids = [aws_subnet.sub_db_a.id, aws_subnet.sub_db_c.id]

  tags = {
    Name = "awesome-ap2-mysql-subgroup"
  }
}

# DB_instance
resource "aws_db_instance" "awesome-db" {
  identifier             = "awesome-db"
  allocated_storage      = 10
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t3.micro"
  db_name                = "mydb"
  username               = "awesome"
  password               = "awesome1!!"
  skip_final_snapshot    = true
  multi_az               = true
  db_subnet_group_name   = aws_db_subnet_group.db_sg.name
  vpc_security_group_ids = [aws_security_group.db.id]
}