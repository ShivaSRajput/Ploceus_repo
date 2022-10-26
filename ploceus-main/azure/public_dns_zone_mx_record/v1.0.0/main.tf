#PUBLIC DNS ZONE MX Record
locals {
  mx_records = {for k,v in var.public_dns_zone_mx_records: k => v.records}
}
resource "azurerm_dns_mx_record" "public_dns_zone_mx_record" {
  for_each = var.public_dns_zone_mx_records
  name                = each.value.name
  zone_name           = each.value.zone_name
  resource_group_name = each.value.resource_group_name
  ttl                 = each.value.ttl
 dynamic "record" {
  for_each = local.mx_records[each.key]
  content {
    preference = record.value.preference
    exchange = record.value.exchange
  }
 }
  tags = merge(each.value.tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}