terraform {
  required_version = "1.11.0"

  backend "s3" {
    use_lockfile = true
    bucket       = "terraform-pipeline"
    key          = "main/terraform.tfstate"
  }
}

provider "aws" {
  region = "us-east-1"
}

variable "branch_name" {
  type = string
}

resource "aws_s3_bucket" "bucket" {
  bucket = "terraform-pipeline-${var.branch_name}-${random_id.suffix.hex}"
}

# random id to create a bucket name
resource "random_id" "suffix" {
  byte_length = 4
}
