
module "networking" {
  source = "../networking"
  CIDR = var.CIDR
  availability_zone = var.availability_zone
}