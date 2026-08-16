variable "project_name" {
  description = "Project name, used in resource tags"
  type        = string
  default     = "aws-ha-web-platform"
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "app_bucket_arn" {
  description = "ARN of the application S3 bucket"
  type        = string
}
