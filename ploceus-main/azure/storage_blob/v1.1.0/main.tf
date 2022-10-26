resource "azurerm_storage_blob" "storage_blob" {
  for_each               = var.storage_blob_variables
  name                   = each.value.name
  storage_account_name   = each.value.storage_account_name
  storage_container_name = each.value.storage_container_name
  type                   = each.value.type
  size                   = lookup(each.value, "size", null)
  content_type           = lookup(each.value, "content_type", null)
  source                 = lookup(each.value, "source", null)
  source_uri             = lookup(each.value, "source_uri", null)
  access_tier            = lookup(each.value, "access_tier", null)
  cache_control          = lookup(each.value, "cache_control", null)
  content_md5            = lookup(each.value, "content_md5", null)
  source_content         = lookup(each.value, "source_content", null)
  parallelism            = lookup(each.value, "parallelism", null)
  metadata               = each.value.metadata
}
