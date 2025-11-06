terraform {
  required_version = "1.11.0"

  backend "s3" {
    use_lockfile = true
    bucket       = var.bucket_name
    key          = "main/terraform.tfstate"
  }
}

provider "aws" {
  region = "us-east-1"
}

variable "bucket_name" {
  type = string
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}
