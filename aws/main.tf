terraform {

    backend "s3"{
        bucket = "tf-states-demo-tolbargy"
        key = "terraform.tfstate"
        encrypt = "true"
    }


    provider "aws" {
        region = "us-east-1"
    }
}