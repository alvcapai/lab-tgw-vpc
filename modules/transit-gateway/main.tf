
resource "ibm_tg_gateway" "tgw" {
  name           = var.tgw_name
  location       = var.region
  global         = false
  resource_group = var.resource_group_name
}

output "transit_gateway_id" {
  value = ibm_tg_gateway.tgw.id
}
