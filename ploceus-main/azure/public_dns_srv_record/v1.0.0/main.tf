# Public DNS ZONE SRV Record

locals {
  srv_records = { for k, v in var.dns_zone_srv_records : k => v.records }
}

resource "azurerm_dns_srv_record" "dns_zone_srv_record" {
  for_each            = var.dns_zone_srv_records
  name                = each.value.name
  zone_name           = each.value.zone_name
  resource_group_name = each.value.resource_group_name
  ttl                 = each.value.ttl
  tags                = merge(each.value.tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
    lifecycle { ignore_changes = [tags["Created_Time"]] }
  dynamic "record" {
    for_each = local.srv_records[each.key]
    content {
      priority = record.value.priority
      weight   = record.value.weight
      port     = record.value.port
      target   = record.value.target
    }
  }

}