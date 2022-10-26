 output "storage_blob_outputs" {
  value = [
    for k, v in var.storage_blob_variables :
    {
       id                    = azurerm_storage_blob.storage_blob[k].id
       url                   = azurerm_storage_blob.storage_blob[k].url
    }
          ]
 }
