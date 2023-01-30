resource "aws_ami_from_instance" "web_was_ami" {
  name                    = "web_was_ami"
  source_instance_id      = aws_instance.was.id
  snapshot_without_reboot = "true"
  tags = {
    Name = "awsome-ap2-web-ami"
  }
}

resource "aws_ami_from_instance" "was_rds_ami" {
  name                    = "was_rds_ami"
  source_instance_id      = aws_instance.web.id
  snapshot_without_reboot = "true"
  tags = {
    Name = "awsome-ap2-was-ami"
  }
}