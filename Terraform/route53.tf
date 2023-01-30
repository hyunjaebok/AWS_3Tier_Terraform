resource "aws_route53_zone" "r53_z" {
  name = "btc-awesome.site"

  tags = {
    Name = "awesome"
  }
}

resource "aws_route53_record" "A" {
  zone_id = aws_route53_zone.r53_z.id
  name    = "btc-awesome.site"
  type    = "A"

  alias {
    evaluate_target_health = true
    name                   = aws_lb.alb.dns_name
    zone_id                = aws_lb.alb.zone_id
  }
}

resource "aws_route53_record" "cname" {
  for_each = {
    for dvo in aws_acm_certificate.acm.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = aws_route53_zone.r53_z.zone_id
}