terraform {
  backend "s3" {
    bucket         = "talacademy-so1-tflab-bucket"
    key            = "talent-academy/elk_infra/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock"
  }
}