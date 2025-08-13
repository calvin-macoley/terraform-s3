terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

resource "random_integer" "randomint" {
  min = 10000
  max = 10000000
}

resource "aws_s3_bucket" "example" {
  bucket = "${var.bucket_prefix}${random_integer.randomint.result}"

  tags = {
    Name = "mck-bucket-${random_integer.randomint.result}"
    Environment = "test"
    ManagedBy = "Terraform"
  }
}

# Blocking public access
resource "aws_s3_bucket_public_access_block" "example" {
    bucket = aws_s3_bucket.example.id

    block_public_acls = true
    block_public_policy = true
    ignore_public_acls = true
    restrict_public_buckets = true
}