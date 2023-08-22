terraform {
  backend "s3" {
    bucket         = "testbucket2023terraform"
    dynamodb_table = "terraform-state-lock"
    key            = "production/terraform.tfstate"
    region         = "us-west-2"
    encrypt        = true
  }
}
