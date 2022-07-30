provider "google" {
  project     = var.project_id
  #region      = var.region
  region      = "us-east1"
  zone        = "us-east1-c"
}

module "instances" {
  source = "./modules/instances"
}
