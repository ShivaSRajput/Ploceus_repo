output "sas_url_query_string" {
  value = [
    for k, v in var.storage_account_sas_variables :
    {
      sas = data.azurerm_storage_account_sas.storage_account_sas[k].sas
    }
  ]
  sensitive = true
}

