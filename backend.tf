terraform {
  backend "s3" {
    bucket = "mydev-project-terraform-12"
    key = "main"
    region = "us-east-1"
    dynamodb_table = "my-dynamodb-table1"
  }
}
