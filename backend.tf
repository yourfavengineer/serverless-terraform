terraform {
  backend "s3" {
    bucket         = "serverless-terrraform-007"
    key            = "serverless_backend/terraform.tfstate" 
    region         = "us-east-1"                            
    encrypt        = true                         
  }
}