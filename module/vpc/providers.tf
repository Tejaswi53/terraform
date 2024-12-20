terraform {
  required_version = "1.9.8"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  #shared_config_files = ["C:/Users/user/.aws/config"]
  #shared_credentials_files = ["C:/Users/user/.aws/credentials"]
  region = "us-east-1"
  assume role {
   role_arn = "arn:aws:iam::982534389470:role/terraform"
  }
}

