resource "aws_acm_certificate" "acm" {
  domain_name       = "btc-awesome.site"
  validation_method = "DNS"
}