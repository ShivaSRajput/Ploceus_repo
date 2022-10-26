resource "azurerm_dns_zone" "public_dns_zone" {

  for_each            = var.public_dns_zone_variable
  name                = each.value.public_dns_zone_name
  resource_group_name = each.value.public_dns_zone_resource_group_name
  dynamic "soa_record" {
    for_each = each.value.public_dns_zone_soa_record
    content {
      email        = soa_record.value.soa_record_email
      host_name    = soa_record.value.soa_record_host_name
      expire_time  = soa_record.value.soa_record_expire_time
      minimum_ttl  = soa_record.value.soa_record_minimum_ttl
      refresh_time = soa_record.value.soa_record_refresh_time
      retry_time   = soa_record.value.soa_record_retry_time
      ttl          = soa_record.value.soa_record_ttl
    }
  }
  tags = merge(each.value.public_dns_zone_tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
  lifecycle { ignore_changes = [tags["Created_Time"]] }
}
