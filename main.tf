provider "aws" {
    region = "us-west-1"
    
}

resource "aws_db_instance" "postgresql" {
  allocated_storage               = var.allocated_storage
  engine                          = "postgres"
  engine_version                  = var.engine_version
  identifier                      = var.database_identifier
  instance_class                  = var.instance_type
  storage_type                    = var.storage_type
  iops                            = var.iops
  name                            = var.database_name
  port                            = var.database_port
  db_subnet_group_name            = var.subnet_group
  parameter_group_name            = var.parameter_group
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