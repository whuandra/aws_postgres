provider "aws" {
    region = "us-west-1"
    
}

resource "aws_db_instance" "postgresql" {
  allocated_storage               = var.allocated_storage
  engine                          = "postgres"
  engine_version                  = var.engine_version
  instance_class                  = var.instance_type
  storage_type                    = var.storage_type
  iops                            = var.iops
  password                        = var.database_password  
  name                            = Win_postgres
  username                        = var.database_username
  port                            = var.database_port
  storage_encrypted               = var.storage_encrypted
  deletion_protection             = var.deletion_protection

  tags = merge(
    {
      Name        = "DatabaseServer",
      Project     = var.project,
      Environment = var.environment
    },
    var.tags
  )
}
