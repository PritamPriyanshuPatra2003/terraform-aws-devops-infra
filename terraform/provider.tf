terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~>6.2"
        }
    }


required_version = "> 1.13.0"
}
provider "aws" {
    region = "ap-south-1"
}