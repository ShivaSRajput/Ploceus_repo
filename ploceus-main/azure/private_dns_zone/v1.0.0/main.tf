#PRIVATE DNS ZONE
resource "azurerm_private_dns_zone" "pvt_dns_zone" {
    for_each = var.private_dns_zones
    name = each.value.name
    resource_group_name = each.value.resource_group_name
    tags = merge(each.value.tags, tomap({ Created_Time = formatdate("DD-MM-YYYY hh:mm:ss ZZZ", timestamp()) }))
    lifecycle { ignore_changes = [tags["Created_Time"]] }
    dynamic "soa_record" {
        for_each = each.value.soa_record_enabled == false ? [] :[1]
        content {
            email = each.value.soa_record["email"]
      expire_time = each.value.soa_record["expire_time"]
      minimum_ttl = each.value.soa_record["minimum_ttl"]
      refresh_time = each.value.soa_record["refresh_time"]
      retry_time =  each.value.soa_record["retry_time"]
      ttl = each.value.soa_record["ttl"]
      tags = each.value.soa_record["soa_tags"]
    }
    }    
}