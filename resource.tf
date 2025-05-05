#Configure data source for amazon linux
data "aws_ami" "amazon-linux" {
    most_recent = true 
    owners = ["amazon"]

    filter {
        name = "name"
        values = ["amzn2-ami-hvm*"]
    }
    filter {
        name = "root-device-type"
        values = ["ebs"]
    }
    filter {
        name = "virtualization-type"
        values = ["hvm"]
        }

}

#create instance profile to add to our role
resource "aws_iam_instance_profile" "role_profile" {
  name = "SSMFullAccess"
  role = aws_iam_role.ssm_access.name
}

#create web-instance 

resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon-linux.id
  instance_type = var.instancetype
  count = 1
  iam_instance_profile = aws_iam_instance_profile.role_profile.name
  subnet_id = aws_subnet.public_subnets[0].id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.sg.id]
  tags = {
    Name = element(var.ec2_names, 0)
  }
  depends_on = [ aws_iam_role.ssm_access, aws_iam_policy_attachment.attachment,  ]
}

resource "aws_cloudwatch_log_group" "log_groups" {
  count = length(var.cloudwatch_log_groups)
  name = "${var.cloudwatch_log_groups[count.index]}"
  retention_in_days = 0
}