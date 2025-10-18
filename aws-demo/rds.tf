resource "aws_db_subnet_group" "db_subnets" {
  name       = "${var.project_name}-db-subnet-group"
  subnet_ids = [aws_subnet.app.id, aws_subnet.db.id]

  tags = {
    Name = "${var.project_name}-db-subnet-group"
  }
}

resource "aws_db_instance" "rds" {
  allocated_storage    = 20
  engine               = "mysql"
  instance_class       = "db.t3.micro"
  db_subnet_group_name = aws_db_subnet_group.db_subnets.name
  username             = var.db_username
  password             = var.db_password
  skip_final_snapshot  = true
  publicly_accessible  = false

  tags = {
    Name = "${var.project_name}-rds"
  }
}
