#PUBLIC DNS ZONE CAA Record
locals {
  caa_records = {for k,v in var.public_dns_zone_caa_records: k => v.records}
}
resource "azurerm_dns_caa_record" "public_dns_zone_caa_record" {
  for_each = var.public_dns_zone_caa_records
  name                = each.value.name
  zone_name           = each.value.zone_name
  resource_group_name = each.value.resource_group_name
  ttl                 = each.value.ttl
 dynamic "record" {
  for_each = local.caa_records[each.key]
  content {
    flags = record.value.flags
    tag = record.value.tag
    value = record.value.value
  }
 }
  tags = merge(each.value.tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
    lifecycle { ignore_changes = [tags["Created_Time"]] }
}