terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
}

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "ap-southeast-1"
}

resource "aws_instance" "sample_ec2" {
    ami = var.default_ubuntu_ami

    instance_type = ( terraform.workspace == "dev" ? "t2.micro" :
                    terraform.workspace == "staging" ? "t2.medium" :
                    terraform.workspace == "prod"  ? "t2.large" :
                                                    "t2.micro"
    )


    tags = {
        Name = "instance-${terraform.workspace}"
    }
}

