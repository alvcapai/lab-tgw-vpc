
# IBM Cloud VPC and Transit Gateway Terraform Module

## Overview

This Terraform configuration deploys:
- ✅ IBM Cloud VPC
- ✅ Transit Gateway

## Usage

1. Customize the `terraform.tfvars` file with your IBM Cloud details.
2. Initialize Terraform:
    terraform init
3. Plan your changes:
    terraform plan
4. Apply the changes:
    terraform apply

## Inputs

| Variable             | Description             | Type   |
|----------------------|-------------------------|--------|
| region               | IBM Cloud region        | string |
| resource_group_name  | Resource group name     | string |
| vpc_name             | VPC name                | string |
| tgw_name             | Transit Gateway name    | string |

## Outputs

| Output               | Description                  |
|----------------------|------------------------------|
| vpc_id               | ID of the created VPC        |
| transit_gateway_id   | ID of the created Transit Gateway |

