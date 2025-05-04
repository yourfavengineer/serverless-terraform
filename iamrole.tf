resource "aws_iam_role" "ssm_access" {
    name = "SSMFUllAccess"
    assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_policy_attachment" "attachment" {
    name = "my-ssm-policy-attachment"
    policy = "arn:aws:iam::967762580629:policy/AmazonSSMFullAccess"
    roles = [aws_iam_role.ssm_access.name]
}

resource "aws_iam_role" "lambda_exec_role" {
  name = "serverless_LambdaRole"

# It defines which service or user or group used this role, here ec2 instance going to use this role
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}
resource "aws_iam_policy_attachment" "lambdarole-attachment" {
    name = "lambdarole-policy-attachment"
    policy = "arn:aws:iam::967762580629:policy/AdministratorAccess"

}