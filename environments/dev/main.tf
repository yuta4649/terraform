module "backend" {
  source = "../../modules/backend"
}

module "s3" {
  source = "../../modules/s3"
}

module "iam" {
  source = "../../modules/iam"
}
