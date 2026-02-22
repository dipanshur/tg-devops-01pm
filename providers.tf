terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.33.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-2"
  assume_role {
    role_arn = "arn:aws:iam::065465165067:role/terraform-role-1pm-devops"
    session_name = "terraform-session"
  }
}