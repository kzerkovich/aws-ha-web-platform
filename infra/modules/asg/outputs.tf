output "asg_name" {
  description = "Name of the autoscaling group"
  value       = aws_autoscaling_group.app.name
}

output "app_sg_id" {
  description = "ID of the app security group"
  value       = aws_security_group.app.id
}
