output "ec2_instance_public_ip" {
    value = aws_instance.firstinstance.public_ip
}

output "RDS_Endpoint" {
    value = aws_db_instance.test_rds.endpoint
}