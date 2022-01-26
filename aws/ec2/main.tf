provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "first_ec2" {
    ami = "ami-04505e74c0741db8d"
    instance_type = "t2.micro"
    key_name = "devops"

    tags = {
        Name = "terraform_ec2"
    }
}