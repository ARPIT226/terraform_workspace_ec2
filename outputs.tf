output "instance_type" {
    description = "instance type selected : "
    value = aws_instance.sample_ec2.instance_type
}

output "instance_id" {
    description = "instance id : "
    value = aws_instance.sample_ec2.id
}