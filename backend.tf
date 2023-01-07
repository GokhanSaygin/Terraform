terraform {
  backend "s3" {
    bucket = "070564344893"
    key    = "tfstate"
    region = "us-east-1"
  }
}
