#RESOURCE GROUP 
resource_group_variables = {
  "resource_group_1" = {
    name     = "ploceusrg000001"
    location = "westus2"
    resource_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

#KEY VAULT
key_vault_variables = {
  "key_vault_1" = {
    name                                  = "ploceuskeyvault000002"
    location                              = "westus2"
    resource_group_name                   = "ploceusrg000001"
    enabled_for_disk_encryption           = true
    enabled_for_deployment                = true
    enabled_for_template_deployment       = true
    enable_rbac_authorization             = false
    soft_delete_retention_days            = "7"
    purge_protection_enabled              = true
    sku_name                              = "standard"
    access_policy_key_permissions         = ["Get", "List", "Create", "Delete", "Recover", "Backup", "Restore", "Purge", "Sign", "Verify", "Encrypt", "Decrypt", "UnwrapKey", "WrapKey", "Import", "Update"]
    access_policy_secret_permissions      = ["Get", "List", "Delete", "Recover", "Backup", "Restore", "Purge", "Set"]
    access_policy_storage_permissions     = []
    access_policy_certificate_permissions = ["Backup", "Create", "Delete", "DeleteIssuers", "Get", "GetIssuers", "Import", "List", "ListIssuers", "ManageContacts", "ManageIssuers", "Purge", "Recover", "Restore", "SetIssuers", "Update"]
    key_vault_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
    network_acls_enabled                    = false
    network_acls_bypass                     = "AzureServices"
    network_acls_default_action             = "Allow"
    network_acls_ip_rules                   = null
    network_acls_virtual_network_subnet_ids = null
    contact_information_enabled             = false
    contact_email                           = "XXXXXXXXXXX@neudesic.com"
    contact_name                            = "XXXXXXXXXXX"
    contact_phone                           = "99999999999"

  }
}
key_vault_certificate_variables = {
  "key_vault_certificate_1" = {
    certificate_name              = "ploceuskeyvaultcertificate000002"
    key_vault_name                = "ploceuskeyvault000002"
    key_vault_resource_group_name = "ploceusrg000001"
    certificate                   = null # provide values values of the Existing certificate by uncommenting th below block if you have Existing Certificate.
    /* certificate = [{
      contents = null
      password = null
    }] */
    certificate_policy = [{
      issuer_parameters = [{
        issuer_name = "Unknown" #Supported values are Self and Unknown
      }]
      key_properties = [{
        curve      = null #  Specifies the curve to use when creating an EC key. Possible values are P-256, P-256K, P-384, and P-521. This field will be required in a future release if key_type is EC or EC-HSM
        exportable = true
        key_size   = "2048" #Possible values include 2048, 3072, and 4096 for RSA keys, or 256, 384, and 521 for EC keys.
        key_type   = "RSA"  # Supported values are RSA and EC
        reuse_key  = true
      }]
      lifetime_action = [{
        action = [{
          action_type = "EmailContacts" # Supported values are AutoRenew,EmailContacts
        }]
        trigger = [{
          days_before_expiry = "30"
        }]
      }]
      secret_properties = [{
        content_type = "application/x-pkcs12" #supported values are application/x-pem-file, application/x-pkcs12
      }]
      x509_certificate_properties = [{
        extended_key_usage = null
        key_usage          = ["cRLSign", "dataEncipherment", "decipherOnly", "digitalSignature", "encipherOnly", "keyAgreement", "keyCertSign", "keyEncipherment", "nonRepudiation"]
        subject            = "CN=ploceusDomain2.com"
        validity_in_months = "12"
        subject_alternative_names = [{
          dns_names = null
          emails    = ["XXXXXXXXXXX@neudesic.com", "XXXXXXXXXXX@neudesic.com"]
          upns      = null
        }]
      }]
    }]
    key_vault_certificate_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}
