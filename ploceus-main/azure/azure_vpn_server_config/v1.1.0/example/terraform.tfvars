resource_group_variables = {
  "resource_group" = {
    name     = "ploceusrg2"
    location = "eastus"
    resource_group_tags = {
      Created_By = "Ploceus",
      Department = "CIS"
    }
  }
}

virtual_wan_variables = {
  "wan_01" = {
    allow_branch_to_branch_traffic    = false
    disable_vpn_encryption            = false
    location                          = "eastus"
    name                              = "PloceusVWan02"
    office365_local_breakout_category = "None"
    resource_group_name               = "ploceusrg2"
    tags = {
      "CreatedBy"  = "Ploceus"
      "Department" = "CIS"
    }
    type = "standard"
  }
}

vpn_server_config = {
  "vpn_server_profile1" = {
    name                     = "MyVPN_Config"
    resource_group_name      = "ploceusrg2"
    location                 = "eastus"
    is_auth_type_AAD         = true
    is_auth_type_certificate = false
    is_auth_type_radius      = false
    is_ipsec_policy          = false
    vpn_authentication_types = ["AAD"]
    vpn_protocols            = ["OpenVPN"]
    ipsec_policy = [{
      dh_group               = "DHGroup24"
      ike_encryption         = "AES256"
      ike_integrity          = "SHA256"
      ipsec_encryption       = "GCMAES256"
      ipsec_integrity        = "GCMAES256"
      pfs_group              = "PFS24"
      sa_data_size_kilobytes = 1024
      sa_lifetime_seconds    = 3600
    }]
    azure_active_directory_authentication = [{
      audience = "9584238a-e3a3-43a7-a049-def2acce4c85"                                    # Application ID
      issuer   = "https://sts.windows.net/687f51c3-0c5d-4905-84f8-97c683a5b9d1/"           # https://sts.windows.net/{tenant ID}/
      tenant   = "https://login.microsoftonline.com/687f51c3-0c5d-4905-84f8-97c683a5b9d1/" # https://login.microsoftonline.com/{tenant ID}/"
    }]
    client_revoked_certificate = [{
      name       = "vpn-ptps-cert-thum"
      thumbprint = "a67c0a0b20d3d16b6ce4b3b1ffd75cc997042581"
    }]
    client_root_certificate = [{
      name             = "vpn-pts-cert"
      public_cert_data = <<EOF
MIIDxTCCAq2gAwIBAgIQNdWQG2hZWV1aM6IFBlkLpjANBgkqhkiG9w0BAQsFADBN
MUswSQYDVQQDHkIATQBTAC0ATwByAGcAYQBuAGkAegBhAHQAaQBvAG4ALQBQADIA
UAAtAEEAYwBjAGUAcwBzACAAWwAyADAAMgAyAF0wHhcNMjIwOTEzMDIwNzQwWhcN
MjIwOTE0MDIxMjQwWjBlMTQwMgYKCZImiZPyLGQBGRYkNjg3ZjUxYzMtMGM1ZC00
OTA1LTg0ZjgtOTdjNjgzYTViOWQxMS0wKwYDVQQDDCQ1ZGM3NmYwZC0xNGRjLTQ2
MGQtYmJlYS00ZDNlNDhkNDFhZGMwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEK
AoIBAQCV/Ht9ImrD1N7JljSPh2Xv70rAqzJzI9JWASUQkt+hA1lFi4kUBYVUHLrY
dd5M+AUrNJ0LNJNHx8pKEN8i98vvug8mcLK1uSDNcQtLf++eUuvPgqfpL3Mn8Low
h09OGXeSEMFF+h+/QWAHnvvP+xOWR8OvfuhWra9p/i6jNdYeJoEmm+fHZRyiqaiv
3o8XUANbQ6Ya7sKRdyrzHRIOo+2lMV8urSjr5LJRWLgp2MvMjJUtWni1mettlnNd
qtlFpeMOn9FV5qA6y31lDRBdPONRT3u66tzPkPUXAJsdd4q/7nDQ42sZkAuYZ0GV
snngHZ2eiFg1+5JcZWUO5VPZYJ2pAgMBAAGjgYgwgYUwDgYDVR0PAQH/BAQDAgWg
MEEGA1UdEQQ6MDiCCUhORUVMQU0wMYIJSE5FRUxBTTAxgg0xOTIuMTY4LjAuMTAx
ggwxOTIuMTY4LjU2LjGCAzo6MTATBgNVHSUEDDAKBggrBgEFBQcDATAbBgkrBgEE
AYI3FQoEDjAMMAoGCCsGAQUFBwMBMA0GCSqGSIb3DQEBCwUAA4IBAQAPM1E0o+M/
M+JmsSjsnEB+QhmZKmsKGK7OK8lnuYo0SBXDy91Rh1/5wIs0kfaK4mRJ+P6B7a2C
JqhtEjMyorlLy1L+g5AWtGyBkdAmCaJlOh/JOYVPCJ2Yb05pWOEHxqcoC6sjAB/e
O8T0Of5gJWjeoNd30tfUy8Sh7sB9tn1L/cRtpmfCXXNQ/6J5WvmjpuYECSw4ONfX
ogUkM0R07L9cBWTL4PR2YH9gqGXSi385gDLWSsfgmc83iyWXac02HMgNWBawsH8n
Lz1J7hQl4zp+CPddfyeu5DXwbvMya4KFcgJ62pxz7p2CTyos8qn9rB/HealqBUVQ
GK/OQiyPAv2I
EOF
      sensitive        = false
    }]
    radius = [{
      server = [{
        address = null
        score   = 1
        secret  = null
      }]
      server_root_certificate = [{
        name             = null
        public_cert_data = null
      }]
    }]
    tags = {
      CreatedBy  = "Ploceus"
      Department = "CIS"
    }
  }
}