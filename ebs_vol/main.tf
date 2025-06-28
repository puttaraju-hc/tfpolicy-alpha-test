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

resource "aws_ebs_volume" "ebs_vol" {
  availability_zone = "us-east-1a"
  size              = 10
  encrypted         = false
}