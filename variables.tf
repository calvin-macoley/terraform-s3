variable "aws_region" {
  description = "Region"
  type        = string
  default     = "us-east-1"
}

variable "bucket_prefix" {
  description = "Prefix"
  type        = string
  default     = "mck-bucket-"
}