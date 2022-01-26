variable "key_name" {
    type = string
    default = "devops"    
}

provider "aws" {
    region = "us-east-1"
}

resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.key_name
  public_key = tls_private_key.example.public_key_openssh
}

resource "aws_instance" "first_ec2" {
    ami = "ami-04505e74c0741db8d"
    instance_type = "t2.micro"
    key_name = aws_key_pair.generated_key.key_name

    tags = {
        Name = "terraform_ec2"
    }
}