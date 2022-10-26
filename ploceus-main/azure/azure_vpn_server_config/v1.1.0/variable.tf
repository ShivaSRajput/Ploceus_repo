variable "vpn_server_config" {
    type = map(object({
        name = string
        location = string
        resource_group_name = string
        is_ipsec_policy = bool
        is_auth_type_AAD = bool
        is_auth_type_certificate = bool
        is_auth_type_radius = bool
        vpn_protocols = list(string)
        ipsec_policy = list(object({
            dh_group = string  #(Required) The DH Group, used in IKE Phase 1. Possible values include DHGroup1, DHGroup2, DHGroup14, DHGroup24, DHGroup2048, ECP256, ECP384 and None.
            ike_encryption = string # (Required) The IKE encryption algorithm, used for IKE Phase 2. Possible values include AES128, AES192, AES256, DES, DES3, GCMAES128 and GCMAES256.
            ike_integrity = string  #(Required) The IKE encryption integrity algorithm, used for IKE Phase 2. Possible values include GCMAES128, GCMAES256, MD5, SHA1, SHA256 and SHA384.
            ipsec_encryption = string #(Required) The IPSec encryption algorithm, used for IKE phase 1. Possible values include AES128, AES192, AES256, DES, DES3, GCMAES128, GCMAES192, GCMAES256 and None.
            ipsec_integrity = string  # (Required) The IPSec integrity algorithm, used for IKE phase 1. Possible values include GCMAES128, GCMAES192, GCMAES256, MD5, SHA1 and SHA2
            pfs_group = string  # (Required) The Pfs Group, used in IKE Phase 2. Possible values include ECP256, ECP384, PFS1, PFS2, PFS14, PFS24, PFS2048, PFSMM and None.
            sa_lifetime_seconds = number     # (Required) The IPSec Security Association lifetime in seconds for a Site-to-Site VPN tunnel.
            sa_data_size_kilobytes = number  # (Required) The IPSec Security Association payloa
        }))
        vpn_authentication_types = list(string)
        client_root_certificate = list(object({
            name = string
            public_cert_data = string
            sensitive = bool
        }))
        client_revoked_certificate = list(object({
            name = string
            thumbprint = string
        }))
        radius = list(object({
            server = list(object({
                address = string
                secret = string
                score = number
            }))
            server_root_certificate = list(object({
                name = string
                public_cert_data = string
            }))
        }))
        azure_active_directory_authentication = list(object({
            audience = string
            issuer = string
            tenant = string
    }))

    tags = map(string)
    }))
  
}