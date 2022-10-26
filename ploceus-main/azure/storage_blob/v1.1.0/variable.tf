variable "storage_blob_variables" {
  type = map(object({
  name                   = string
  storage_account_name   = string
  storage_container_name =  string
  type                   = string
  size                   = number
  content_type           = string
  source                 = string
  source_uri             = string
  access_tier            = string
  cache_control          = string
  content_md5            = string
  source_content         = string
  parallelism            = number
  metadata               = map(string)
  }))
}
