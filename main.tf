provider "aws" {
    region = "us-west-1"
    
}

resource "postgresql_database" "my_db" {
  name              = "my_db"
  owner             = "my_role"
  template          = "template0"
  lc_collate        = "C"
  connection_limit  = -1
  allow_connections = true
}