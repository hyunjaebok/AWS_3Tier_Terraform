# image_id
variable "image_id" {
  description = "The name of the instance_ami"
  type        = string
  default     = ""
}

# instance_type
variable "instance_type" {
  description = "The name of the instance_type"
  type        = string
  default     = "t2.micro"
}

# instance_security_group_name
variable "instance_security_group_name" {
  description = "The name of the secruity group for the EC2 Instances"
  type        = string
  default     = "allow_http_ssh_instance"
}

# server_http_port
variable "server_http_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = "80"
}

# server_ssh_port
variable "server_ssh_port" {
  description = "The port the server will use for SSH requests"
  type        = number
  default     = "22"
}

# db_secrity_group_name
variable "db_secrity_group_name" {
  description = "The name of the secruity group for the RDS"
  type        = string
  default     = "allow_mysql_db"
}

# alb_name
variable "alb_name" {
  description = "The name of the ALB"
  type        = string
  default     = "awesome-alb"
}

# alb_security_group_name
variable "alb_security_group_name" {
  description = "The name of the security group for the ALB"
  type        = string
  default     = "allow_http_alb"
}
