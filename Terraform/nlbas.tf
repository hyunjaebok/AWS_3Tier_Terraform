#시작 구성
resource "aws_launch_configuration" "was" {
  name_prefix     = "awsome-ap2-web-conf"
  image_id        = aws_ami_from_instance.was_rds_ami.id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.was.id]
  key_name        = aws_key_pair.awesomekey.key_name
  user_data       = file("was.tpl")

  lifecycle {
    create_before_destroy = true
  }
}

#오토스케일링 그룹
resource "aws_autoscaling_group" "was" {
  name_prefix          = "awsome-ap2-was-as"
  launch_configuration = aws_launch_configuration.was.name
  vpc_zone_identifier  = [aws_subnet.sub_was_a.id, aws_subnet.sub_was_c.id]

  target_group_arns = [aws_lb_target_group.nlb_tg.arn]
  health_check_type = "ELB"

  min_size = 2
  max_size = 4

  tag {
    key                 = "Name"
    value               = "asg-was"
    propagate_at_launch = true
  }
}

# 오토 스케일링 정책
resource "aws_autoscaling_policy" "was" {
  name                      = "was-scaling-policy"
  policy_type               = "TargetTrackingScaling"
  autoscaling_group_name    = aws_autoscaling_group.was.id
  estimated_instance_warmup = 200
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = "60"
  }
}