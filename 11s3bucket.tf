provider "aws" {
  region     = "ap-southeast-1"
  access_key = "AKIA5CY7AN3CABU43L7A"
  secret_key = "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"
 }
 
resource "aws_s3_bucket" "s3bucketmss" {
  bucket = "s3-bucket-mss"
  acl = "private"
  versioning {
    enabled = true
  }


lifecycle_rule {
    enabled = true

    transition {
      days = 30
      storage_class = "STANDARD_IA"
    }

    transition {
      days = 60
      storage_class = "GLACIER"
    }
  }

  tags = {
    Name = "S3 Bucket MSS by Terraform"
  }
}