variable "project_name" {
  description = "Project name, used in resource tags"
  type        = string
  default     = "aws-ha-web-platform"
}

variable "environment" {
  description = "Environment name"
  type        = string
}
