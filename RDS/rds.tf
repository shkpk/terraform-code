resource "aws_db_subnet_group" "test_rds_subnet_grp" {
  name       = "main"
  subnet_ids = [aws_subnet.subnet_private_1.id, aws_subnet.subnet_private_2.id]

  tags = {
    Name = "My DB subnet group"
  }
}
resource "aws_db_parameter_group" "test-rds-parameters" {
  name        = "test-rds-parameters"
  family      = "mariadb10.4"
  description = "MariaDB parameter group"

  parameter {
    name  = "max_allowed_packet"
    value = "16777216"
  }
}

resource "aws_db_instance" "test_rds" {
  allocated_storage       = 20
  engine                  = "mariadb"
  engine_version          = "10.4.18"
  instance_class          = "db.t3.micro"
  identifier              = "mariadb"
  name                    = "mariadb"
  username                = "root"
  password                = "mariadb141"
  db_subnet_group_name    = aws_db_subnet_group.test_rds_subnet_grp.name
  parameter_group_name    = aws_db_parameter_group.test-rds-parameters.name
  multi_az                = true
  vpc_security_group_ids  = [aws_security_group.allow_mariadb.id]
  storage_type            = "gp2"
  backup_retention_period = 30
#   availability_zone       = aws_subnet.subnet_private_1.availability_zone
  skip_final_snapshot     = true

  tags = {
    Name = "RDS Instance"
  }
}
