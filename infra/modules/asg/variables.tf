variable "project_name" {
  description = "Project name, used in resource tags"
  type        = string
  default     = "aws-ha-web-platform"
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "private_subnet_ids" {
  description = "IDs of private subnets for instances"
  type        = list(string)
}

variable "alb_sg_id" {
  description = "ID of the ALB security group"
  type        = string
}

variable "target_group_arn" {
  description = "ARN of the ALB target group"
  type        = string
}

variable "ami_id" {
  description = "AMI for instances (Moto example AMI; replace for real AWS)"
  type        = string
  default     = "ami-12c6146b"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "instance_profile_name" {
  description = "IAM instance profile name for instances"
  type        = string
  default     = ""
}
