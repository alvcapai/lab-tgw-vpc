variable "ibmcloud_api_key" {
  description = "IBM Cloud API Key"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "IBM Cloud region"
  type        = string
  default     = "us-south"
}

variable "resource_group_A" {
  description = "Resource Group A"
  type        = string
  default     = "Transit-VPC-rg"
}

variable "resource_group" {
  description = "IBM Cloud resource group"
  type        = string
  default     = "RG-alvaro"
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "transit-vpc"
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
  default     = "subnet-transit"
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.240.0.0/25"
}

variable "internal_subnet_cidr" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.240.0.128/25"
}

variable "zone" {
  description = "IBM Cloud zone"
  type        = string
  default     = "us-south-1"
}

variable "ssh_key_name" {
  description = "Name of the SSH key"
  type        = string
  default     = "jumpserver-ssh-key-alvaro"
}

variable "instance_name" {
  description = "Name of the jump server instance"
  type        = string
  default     = "linux-jumpserver-alvaro"
}

variable "instance_profile" {
  description = "Profile for the jump server instance"
  type        = string
  default     = "bx2-2x8"
}

variable "image_name" {
  description = "Name of the OS image"
  type        = string
  default     = "ibm-debian-12-12-minimal-amd64-1"
}

variable "ssh_pub_key" {
  description = "public key"
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDG1xrrLipGM4LFVQHb1q5LCx8/sBaSSHMxSVOJ22vBd4mj2yd8KAUi6cXvmzb/oxkiwMGj+M5yplhzFzNW0ceGmtNCnJx/qYAOOhdIbNw5BmuQcdxHfGHgS4TeUe8ENDYt9TNF6kggTUITVs7/e1k44/ci8Uws0NeBi2n7wzDUVbWqzuslpqCoZTzqBbsSpNGYSSU6L09tfok/bBl2Eoc85Ruq1MSoIIIzYe9uswTKx9r9SLlCA9xxx1ijTFi6XQIX9bXltpXzeqEus1jsafl+YmBjOrjqfLCYlQWAxKJvWHSqwCg3ZSaBRewWS2/RUC3wszLq6jmyNqqA3Rv4Wl9sRGunhKKEmozgT7dry/c9W+znQpF9VifMTu9MsqLg3sWSHxT+OWy7HnBR+/+9qWKZjnGvm9xaInnpVC2x4phs3A5a2p/NIPfGiHhu/nJlPlGuKOWqovqpKl9XM2V3SMhZKakgfqEe8NMmtzHq8U4taipJp3M8JhvaDWjvhKYx6xozVNokf2+rql++1er6xkExvAyARzVOPIaqa9HnfagbyRAn2KXgSBZvduGaRJ8MnrH1/OE4yEle1sOzM0bX7nU2SgKJyYsilfQtu9GhHMvDkWf2Vawyo9SCjh0e+PHzB14NCh/Fq4oEUNB3duQV2ntMtQ67b4f4FukrZfB2ipnIjw== acapai@alvaros-air.br.ibm.com"
}
