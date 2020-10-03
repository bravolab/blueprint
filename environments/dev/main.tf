# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
variable "token" {}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.token
}

locals {
  image  = "ubuntu-18-04-x64"
  name   = "web-1"
  region = "nyc2"
  size   = "s-1vcpu-1gb"
}

# Include for the web module
module "dev_web_server" {
  source = "../modules/module"

  image  = local.image
  name   = local.name
  region = local.region
  size   = local.size
}