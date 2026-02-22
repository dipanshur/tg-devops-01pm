terraform {
  backend "s3" {
    bucket = "technogeeks-demo-bucket-1pm-we"
    key    = "terraform-state/terraform.tfstate"
    region = "us-east-2"
    
  }
}