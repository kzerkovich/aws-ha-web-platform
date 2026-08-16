output "bucket_id" {
  description = "Name of the app bucket"
  value       = aws_s3_bucket.app.id
}

output "bucket_arn" {
  description = "ARN of the app bucket"
  value       = aws_s3_bucket.app.arn
}
