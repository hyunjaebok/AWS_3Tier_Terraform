# NLB
resource "aws_lb" "nlb" {
  name               = "was-nlb"
  internal           = true
  load_balancer_type = "network"
  subnets            = [aws_subnet.sub_was_a.id, aws_subnet.sub_was_c.id]

  tags = {
    Environment = "production"
  }
}

# ASG의 대상 그룹 생성
resource "aws_lb_target_group" "nlb_tg" {
  name     = "awsome-ap2-was-tg"
  port     = 8009
  protocol = "TCP"
  vpc_id   = aws_vpc.main.id

  health_check {
    protocol            = "TCP"
    interval            = 10
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
  lifecycle {
    create_before_destroy = true
  }
}


# ALB의 리스너
resource "aws_lb_listener" "tcp" {
  load_balancer_arn = aws_lb.nlb.arn
  port              = 8009
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nlb_tg.arn
  }
}