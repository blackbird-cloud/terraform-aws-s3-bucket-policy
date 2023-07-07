output "policy" {
  value       = data.aws_iam_policy_document.combined.json
  description = "The applied S3 bucket policy."
}
