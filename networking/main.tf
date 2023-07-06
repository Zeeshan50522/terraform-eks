resource "aws_vpc" "main" {
    
  cidr_block       = var.CIDR

  tags = {
    Name = terraform.workspace
  }
}

