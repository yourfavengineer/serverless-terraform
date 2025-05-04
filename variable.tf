variable "bucket_name"{
    type = string
}

variable "instance_type"{
    type = list
}

variable "ec2_names" {
    type = list
}

variable "function_name" {
    type = list(string)
}

variable "cloudwatch_log_groups"{
    type = list(string)
}

variable "aws_azs" {
        type = list(string)
}

variable "public_subnet_cidrs" {
        type        = list(string)
        description = "Public Subnet CIDR values"
}

variable "private_subnet_cidrs" {
        type = list(string)
        description = "Private subnet CIDR values"
}

variable "paths"{
        type = list(string)
}

variable "AWS_REGION" {
  default   = "us-east-1"
  type      = string
  sensitive = true
}

variable "AWS_ACCOUNT_ID" {
  default   = "<put-your-account-ID"
  type      = string
  sensitive = true
}
