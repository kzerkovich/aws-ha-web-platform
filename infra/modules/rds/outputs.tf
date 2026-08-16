output "db_endpoint" {
  description = "Connection endpoint of the RDS instance"
  value       = aws_db_instance.main.endpoint
}

output "db_sg_id" {
  description = "ID of the DB security group"
  value       = aws_security_group.db.id
}
