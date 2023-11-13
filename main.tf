provider "aws" {
    region = "us-east-1"
    
}

resource "aws_db_instance" "postgresql" {
  allocated_storage               = 30
  // name                            = "Databaseterraform1"
  engine                          = "postgres"
  engine_version                  = "11.16"
  instance_class                  = "db.t3.micro"
  storage_type                    = var.storage_type
  iops                            = var.iops
  password                        = var.database_password  
  username                        = var.database_username
  port                            = var.database_port
  storage_encrypted               = var.storage_encrypted
  deletion_protection             = var.deletion_protection

  tags = merge(
    {
 //     Project     = var.project,
      Environment = var.environment
    },
 //   var.tags
  )
}
