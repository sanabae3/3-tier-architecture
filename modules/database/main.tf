resource "random_password" "password" { #A
  length           = 16
  special          = true
  override_special = "_%@/'\""
}

resource "aws_db_instance" "database" {
  allocated_storage      = 10
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t2.micro"
  identifier             = "${var.namespace}-db-instance"
  name                   = "evoluit"
  username               = "luit"
  access key               = aws_access_key_id
  secret access key      = aws_secret_access_key_id
  db_subnet_group_name   = var.vpc.database_subnet_group #B
  vpc_security_group_ids = [var.sg.db] #B
  skip_final_snapshot    = true
}
