# #RESOURCE GROUP
# resource "azurerm_resource_group" "resource_group" {
#   for_each = var.resource_group_variables #local.is_resourcegroup_exists
#   name     = each.value.resource_group_name
#   location = each.value.location
#   tags     = merge(each.value.resource_group_tags)
# }
# DNS Zone

resource "azurerm_dns_zone" "dnszone" {

    for_each                  = var.dns_zone_variable
    name                      = each.value.name
    resource_group_name       = each.value.resource_group_name
    soa_record                {
        email          = each.value.soa_record.email
        host_name      = each.value.soa_record.host_name
        expire_time    = each.value.soa_record.expire_time
        minimum_ttl    = each.value.soa_record.minimum_ttl
        refresh_time   = each.value.soa_record.refresh_time
        retry_time     = each.value.soa_record.retry_time
        ttl            = each.value.soa_record.ttl

    }
}
