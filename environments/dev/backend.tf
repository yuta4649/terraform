terraform {
  backend "s3" {
    bucket       = "media-api-tfstate-bucket-dev-f3d9997bdcf81e67"
    key          = "terraform.tfstate"
    region       = "ap-northeast-1"
    encrypt      = true
    use_lockfile = true
  }
}
