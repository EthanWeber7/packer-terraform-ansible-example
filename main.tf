# main.tf

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-08d70e59c07c61a3a"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}

# lambda.tf

resource "aws_lambda_function" "hello_lambda" {
  function_name = "my_function_name"
  timeout       = 300
  memory_size   = 256

  environment {
    variables = {
      DB_PASSWORD = "SecretSauce"
      DB_ADDRESS  = "10.12.109.35"
    }
  }
}

# variables.tf

variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ExampleAppServerInstance"
}
