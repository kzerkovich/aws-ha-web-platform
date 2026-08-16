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

variable "public_subnet_ids" {
  description = "IDs of public subnets for the ALB"
  type        = list(string)
}
