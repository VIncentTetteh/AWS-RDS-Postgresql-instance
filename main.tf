provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "your-bucket-name"
    key    = "your-key-name"
    region = "us-east-1"
  }
}

resource "aws_db_instance" "postgres" {
  allocated_storage    = 20
  engine               = "postgres"
  engine_version       = "12.6"
  instance_class       = "db.t3.micro"
  name                 = "your-db-name"
  username             = "your-db-username"
  password             = var.db-password
  parameter_group_name = "default.postgres12"
  
  tags = {
    Name = "your-db-name"
  }
}
