output "sas_url_query_string" {
  value     = module.storage_account_sas.sas_url_query_string
  sensitive = true
}
