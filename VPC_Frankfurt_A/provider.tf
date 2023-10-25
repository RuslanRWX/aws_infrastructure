terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #     version = "~> 4.0"
    }
    ct = {
      source  = "poseidon/ct"
      version = "0.11.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-central-1"
}

provider "ct" {}
