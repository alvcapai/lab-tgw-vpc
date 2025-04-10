# Create a VPC
resource "ibm_is_vpc" "vpc" {
  name = var.vpc_name
}

resource "ibm_resource_group" "resourceGroupA" {
 name     = var.resource_group_A
}

# Create a Subnet and attach the Public Gateway
resource "ibm_is_subnet" "subnet" {
  name            = var.subnet_name
  vpc             = ibm_is_vpc.vpc.id
  zone            = var.zone
  ipv4_cidr_block = var.subnet_cidr
  #public_gateway  = ibm_is_public_gateway.public_gateway.id
  resource_group = ibm_resource_group.resourceGroupA.id
  
}

# Internal Subnet
resource "ibm_is_subnet" "internal_subnet" {
  name            = "${var.subnet_name}-internal"
  vpc             = ibm_is_vpc.vpc.id
  zone            = var.zone
  ipv4_cidr_block = var.internal_subnet_cidr # Change as needed
  resource_group = ibm_resource_group.resourceGroupA.id
}

  # public_gateway {
  #   id = ibm_is_public_gateway.public_gateway.id
  # }

# Create a Security Group
resource "ibm_is_security_group" "security_group" {
  name = "${var.vpc_name}-sg"
  vpc  = ibm_is_vpc.vpc.id
  resource_group = ibm_resource_group.resourceGroupA.id
}

# Allow SSH access
resource "ibm_is_security_group_rule" "allow_ssh" {
  group      = ibm_is_security_group.security_group.id
  direction  = "inbound"
  remote     = "187.57.31.15" ### alterar
  tcp {
    port_min = 22
    port_max = 22
  }
}

# Allow all outbound traffic
resource "ibm_is_security_group_rule" "allow_all_outbound" {
  direction      = "outbound"
  ip_version     = "ipv4"
  group          = ibm_is_security_group.security_group.id
  remote         = "0.0.0.0/0"
}


# Allow ICMP (Ping)
resource "ibm_is_security_group_rule" "allow_icmp" {
  group      = ibm_is_security_group.security_group.id
  direction  = "inbound"
  ip_version = "ipv4"
  remote     = "0.0.0.0/0"
}

# Create an SSH Key on IBM Cloud
resource "ibm_is_ssh_key" "ssh_key" {
  name       = var.ssh_key_name
  public_key = var.ssh_pub_key
  type       = "rsa"
  resource_group = ibm_resource_group.resourceGroupA.id
}

# Data source for the OS image
data "ibm_is_image" "os_image" {
  name = var.image_name
}

# Create a Floating IP
resource "ibm_is_floating_ip" "floating_ip" {
  name        = "${var.instance_name}-fip"
  #zone        = var.zone
  target      = ibm_is_instance.jump_server.primary_network_interface[0].id
  resource_group = ibm_resource_group.resourceGroupA.id
}

# Create a Virtual Server Instance (Jump Server)
resource "ibm_is_instance" "jump_server" {
  name    = var.instance_name
  vpc     = ibm_is_vpc.vpc.id
  profile = var.instance_profile
  zone    = var.zone
  image   = data.ibm_is_image.os_image.id
  resource_group = ibm_resource_group.resourceGroupA.id
  #resource_group = var.resource_group_C

  primary_network_interface {
    subnet          = ibm_is_subnet.subnet.id
    security_groups = [ibm_is_security_group.security_group.id]
  }

  # Additional Network Interface (Internal)
  # network_interfaces {
  #   subnet          = ibm_is_subnet.internal_subnet.id
  #   security_groups = [ibm_is_security_group.security_group.id]
  # }

  keys = [ibm_is_ssh_key.ssh_key.id]
}

# Output the Floating IP Address
output "floating_ip" {
  value = ibm_is_floating_ip.floating_ip.address
  description = "The public floating IP address assigned to the instance"
}
