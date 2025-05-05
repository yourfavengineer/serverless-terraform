output  "s3_bucket" {
  value = "${aws_s3_bucket.bucket.arn}"
}
output "SSM-Role"{
value = [aws_iam_role.ssm_access.arn,aws_iam_role.ssm_access.id]

}
output "lambdarole" {
    value = [
        aws_iam_role.lambda_exec_role.arn, 
        aws_iam_role.lambda_exec_role.name,
        aws_iam_role.lambda_exec_role.id
    ]
}

output "Instance_IP"{
        value = aws_instance.web.*.public_ip
}

output "Lambda_Functions"{
        value = [for function in aws_lambda_function.my_lambda : "${function.function_name} - ${function.arn}"]
}

output "API-Gateways"{
        value = [for api_key, api in aws_api_gateway_rest_api.my_api :
    {
      api_name      = api.name
      invoke_url    = aws_api_gateway_deployment.deployment[api_key].invoke_url
    }]
}