# alb_dns_name
output "alb_dns_name" {
  value       = aws_lb.alb.dns_name
  description = "The domain of the load balancer"
}