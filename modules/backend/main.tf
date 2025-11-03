resource "random_id" "suffix" {
  byte_length = 8
}

resource "aws_s3_bucket" "this" {
  bucket = "${local.bucket_name}-${var.environment}-${random_id.suffix.hex}"
  tags = {
    Name = "${local.bucket_name}-${var.environment}-${random_id.suffix.hex}"
    Environment = var.environment
  }
}
