terraform {
  backend "s3" {
    bucket = "terraform-state-bucket-for-demo"
    region = "eu-central-1"
    key = "infra.tfstate"
    workspace_key_prefix = "demo"
  }
}
