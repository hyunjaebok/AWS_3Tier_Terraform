# aws_key_pair
resource "aws_key_pair" "awesomekey" {
  key_name   = "awesomekey"
  public_key = file("awesomekey.pub")
}

# EC2_instance(public_subnet)
resource "aws_instance" "web" {
  ami                    = var.image_id == "" ? data.aws_ami.amazonlinux.id : var.image_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.img.id]
  key_name               = "awesomekey"
  subnet_id              = aws_subnet.sub_pub_a.id


  tags = {
    Name = "awesome-web-img"
  }
}

# EC2_instance(public_subnet)
resource "aws_instance" "was" {
  ami                    = var.image_id == "" ? data.aws_ami.amazonlinux.id : var.image_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.img.id]
  key_name               = "awesomekey"
  subnet_id              = aws_subnet.sub_pub_a.id


  tags = {
    Name = "awesome-was-img"
  }
}

# data_source_ami
data "aws_ami" "amazonlinux" {
  most_recent = true
  name_regex  = "^amzn2-"
  owners      = ["137112412989"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*-gp2"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}