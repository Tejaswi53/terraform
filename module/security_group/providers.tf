terraform {
    required_version = "~> 1.10.1"

    required_providers {
        aws = {
         source = "hashicorp/aws"
         version = "5.81.0"
        }
    }
}
provider "aws" {
  shared_config_files = ["C:/Users/user/.aws/config"]
  shared_credentials_files = ["C:/Users/user/.aws/credentials"]
}
