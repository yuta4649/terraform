variable "bucket_name" {
  description = "S3 Bucket 名"
  type        = string
}

variable "lambda_role_arn" {
  description = "Lambda に割り当てられる IAM ロールの ARN"
  type        = string
}
