output "instance_profile_name" {
  description = "Name of the app instance profile"
  value       = aws_iam_instance_profile.app.name
}

output "app_role_arn" {
  description = "ARN of the app role"
  value       = aws_iam_role.app.arn
}
