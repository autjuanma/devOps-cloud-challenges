# Module declaration
module "s3_bucket" {
  # Module metadata
  description = "Provisions an S3 bucket with versioning and server-side encryption"

  # S3 bucket resource
  resource "aws_s3_bucket" "this" {
    bucket = var.bucket_name
    region = var.region

    # Enable versioning
    versioning {
      enabled = true
    }

    # Enable server-side encryption with the default AWS-managed key
    server_side_encryption_configuration {
      rule {
        apply_server_side_encryption_by_default {
          sse_algorithm = "AES256"
        }
      }
    }
  }
}