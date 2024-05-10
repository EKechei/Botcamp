resource "aws_db_subnet_group" "dbsubnetgroup" {
  name       = "databasesubnetgroup"
  subnet_ids = [aws_subnet.private3.id, aws_subnet.private4.id]

  tags = {
    Name = "databasesubnetgroup"
  }
}

resource "aws_db_instance" "databaseinstance" {
  allocated_storage    = 20
  db_name              = "applicationdb"
  engine               = "mysql"
  engine_version       = "5.7.44"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "Challenge123"
  db_subnet_group_name = aws_db_subnet_group.dbsubnetgroup.id
  skip_final_snapshot  = true
  multi_az              = false
  publicly_accessible  = false
  storage_encrypted    = false
  vpc_security_group_ids       = [aws_security_group.databasesg.id]
  tags = {
    Name = "MyDatabaseInstance"
  }
}