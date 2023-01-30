# ALB
resource "aws_lb" "alb" {
  name               = "awesome-ap2-web-alb"
  load_balancer_type = "application"
  subnets            = [aws_subnet.sub_pub_a.id, aws_subnet.sub_pub_c.id]
  security_groups    = [aws_security_group.alb.id]
}

# ASG의 대상 그룹 생성
resource "aws_lb_target_group" "alb_tg" {
  name     = "awsome-ap2-web-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 15
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
  lifecycle {
    create_before_destroy = true
  }
}


# ALB의 리스너
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  # By default, return a simple 404 page
  default_action {
    type             = "fixed-response"
    target_group_arn = aws_lb_target_group.alb_tg.arn

    fixed_response {
      content_type = "text/plain"
      message_body = "404: page not found"
      status_code  = 404
    }
  }
}
# ALB의 리스너
resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 443
  protocol          = "HTTPS"
  certificate_arn   = aws_acm_certificate.acm.arn

  # By default, return a simple 404 page
  default_action {
    type             = "fixed-response"
    target_group_arn = aws_lb_target_group.alb_tg.arn

    fixed_response {
      content_type = "text/plain"
      message_body = "404: page not found"
      status_code  = 404
    }
  }
}

# 리스너 규칙 생성 및 연결
resource "aws_lb_listener_rule" "alb_asg" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 100

  condition {
    path_pattern {
      values = ["*"]
    }
  }

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }
}

resource "aws_lb_listener_rule" "alb_asg1" {
  listener_arn = aws_lb_listener.https.arn
  priority     = 100

  condition {
    path_pattern {
      values = ["*"]
    }
  }

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }
}
