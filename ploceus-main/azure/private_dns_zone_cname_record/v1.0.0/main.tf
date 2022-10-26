#PRIVATE DNS ZONE CNAME RECORD
resource "azurerm_private_dns_cname_record" "private_dns_zone_cname_record" {
  for_each            = var.private_dns_zone_cname_records
  name                = each.value.name
  zone_name           = each.value.zone_name
  resource_group_name = each.value.resource_group_name
  ttl                 = each.value.ttl
  record             = each.value.record
  tags                = merge(each.value.tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
    lifecycle { ignore_changes = [tags["Created_Time"]] }
}
