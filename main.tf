module "backend" {
  source      = "./modules/backend"
  bucket_name = "media-api-tfstate-bucket"
}


module "s3" {
  source      = "./modules/s3"
  bucket_name = "media-api-bucket"
}
