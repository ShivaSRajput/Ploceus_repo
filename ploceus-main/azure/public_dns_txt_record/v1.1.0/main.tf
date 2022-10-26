#PUBLIC DNS ZONE TXT Record

locals {
  txt_records = { for k, v in var.azurerm_dns_zone_txt_records : k => v.records }
}

resource "azurerm_dns_txt_record" "dns_zone_txt_record" {
  for_each            = var.azurerm_dns_zone_txt_records
  name                = each.value.name
  zone_name           = each.value.zone_name
  resource_group_name = each.value.resource_group_name
  ttl                 = each.value.ttl
  tags                = merge(each.value.tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
    lifecycle { ignore_changes = [tags["Created_Time"]] }
  dynamic "record" {
    for_each = local.txt_records[each.key]
    content {
      value = record.value.value
    }
  }

}
