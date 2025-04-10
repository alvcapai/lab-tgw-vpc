
terraform {
  required_providers {
    ibm = {
      source  = "ibm-cloud/ibm"
      version = ">= 1.49.0"
    }
  }

  required_version = ">= 1.6.0"
}

provider "ibm" {
  region = var.region
}

module "vpc" {
  source              = "./modules/vpc"
  region              = var.region
  resource_group_name = var.resource_group_name
  vpc_name            = var.vpc_name
}

module "transit_gateway" {
  source              = "./modules/transit-gateway"
  region              = var.region
  resource_group_name = var.resource_group_name
  tgw_name            = var.tgw_name
}
