terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "mel-ciscolabs-com"
    workspaces {
      name = "aci-mel-fabric"
    }
  }
  required_providers {
    aci = {
      source = "CiscoDevNet/aci"
      # version = "~> 0.5.1"
    }
  }
}

### Shared Providers ###

provider "aci" {
  username = var.aci_user
  password = var.aci_password
  url      = var.aci_url
  insecure = true
}

### ACI Tenant Object Module ###
module "mel_dc4" {
  source = "github.com/cisco-apjc-cloud-se/terraform-aci-fabric-object"

  ### Fabric ###
  fabric   = var.fabric

}
