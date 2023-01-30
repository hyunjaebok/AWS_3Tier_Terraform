#시작 구성
resource "aws_launch_configuration" "web" {
  name_prefix     = "awsome-ap2-web-conf"
  image_id        = aws_ami_from_instance.web_was_ami.id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.web.id]
  key_name        = aws_key_pair.awesomekey.key_name

  user_data = templatefile("web.tfpl", {
    nlb_dns = aws_lb.nlb.dns_name
  })

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [aws_lb.nlb]
}

#오토스케일링 그룹
resource "aws_autoscaling_group" "web" {
  name_prefix          = "awsome-ap2-web-as-"
  launch_configuration = aws_launch_configuration.web.name
  vpc_zone_identifier  = [aws_subnet.sub_web_a.id, aws_subnet.sub_web_c.id]

  target_group_arns = [aws_lb_target_group.alb_tg.arn]
  health_check_type = "ELB"

  min_size = 2
  max_size = 4

  tag {
    key                 = "Name"
    value               = "asg-web"
    propagate_at_launch = true
  }
}

# 오토 스케일링 정책
resource "aws_autoscaling_policy" "web" {
  name                      = "web-scaling-policy"
  policy_type               = "TargetTrackingScaling"
  autoscaling_group_name    = aws_autoscaling_group.web.id
  estimated_instance_warmup = 200
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = "60"
  }
}