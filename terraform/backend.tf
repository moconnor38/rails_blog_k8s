terraform {
  backend "gcs" {
    bucket = "blog_tfstate"
    prefix = "terraform/state"
  }
}
