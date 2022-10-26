locals {
    public_dns_zone_cname_record    = { for k, v in var.public_dns_zone_cname_records : k => v if lookup(v, "addAliasRecord", "NULL") != true }
    public_dns_zone_cname_alias_record     = { for k, v in var.public_dns_zone_cname_records : k => v if lookup(v, "addAliasRecord", "NULL") == true }
}

data "azurerm_dns_zone" "example" {
for_each            = local.public_dns_zone_cname_alias_record
name = each.value.zone_name
resource_group_name = each.value.resource_group_name
}

#PUBLIC DNS ZONE CNAME RECORD
resource "azurerm_dns_cname_record" "public_dns_zone_cname_record" {
  for_each            = local.public_dns_zone_cname_record
  name                = each.value.name
  zone_name           = each.value.zone_name
  resource_group_name = each.value.resource_group_name
  ttl                 = each.value.ttl
  record              = each.value.record 
  tags                = merge(each.value.tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
    lifecycle { ignore_changes = [tags["Created_Time"]] }
}

#either record OR target_resource_id must be specified, but not both.
#PUBLIC DNS ZONE CNAME WITH TARGET RESOURCE ID RECORD (ALIAS RECORD)
resource "azurerm_dns_cname_record" "public_dns_zone_cname_alias_record" {
  for_each            = local.public_dns_zone_cname_alias_record
  name                = each.value.name
  zone_name           = each.value.zone_name
  resource_group_name = each.value.resource_group_name
  ttl                 = each.value.ttl
  target_resource_id  = "${data.azurerm_dns_zone.example[each.key].id}/CNAME/${each.value.target_cname_record}"
  tags                = merge(each.value.tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
    lifecycle { ignore_changes = [tags["Created_Time"]] }
}
