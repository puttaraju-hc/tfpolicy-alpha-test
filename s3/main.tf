terraform { 
  cloud { 
   
    organization = "pks-hc" 
    workspaces { 
      name = "pks-tfpolicy-ws" 
    } 
  } 
  required_providers {
    aws = {
      source  = "hashicorp/aws"

    }
  }
  required_version = ">= 1.13.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "pks-bucket"
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.example.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
