variable "project_name" {
  description = "Project name, used in resource tags"
  type        = string
  default     = "aws-ha-web-platform"
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "asg_name" {
  description = "Name of the autoscaling group"
  type        = string
}

variable "db_identifier" {
  description = "Identifier of the RDS instance"
  type        = string
}

variable "alert_email" {
  description = "Email for alert subscriptions"
  type        = string
  default     = "devops@example.com"
}
