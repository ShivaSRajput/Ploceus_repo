Disk encryption Set have dependency on Key Vault Key and Key Vault Access Policy.
Key Vault Key have dependency on Key Vault.
So for a disk encryption set to work properly, we need all the dependent modules to be created.

Tested Scenarios:
=================
Scenario 1:
One key vault               : ploceuskeyvault000401a
Two key vault keys          : ploceuskey000401a1 and ploceuskey000401a2
Two disk encryption set     : ploceuploceusdiskencryptionset000401a1 and ploceuploceusdiskencryptionset000401a2
Two key vault access policy : key_vault_access_policy_1 and key_vault_access_policy_2
Disk encryption Set ploceuploceusdiskencryptionset000401a1 uses the key ploceuskey000401a1
Disk encryption Set ploceuploceusdiskencryptionset000401a2 uses the key ploceuskey000401a2
Both keys are in same key vault.
Both disk encryption set will be given access to the key vault ploceuskeyvault000401a

Scenario 2:
Two key vault                   : ploceuskeyvault000401a and ploceuskeyvault000401b
Three key vault keys            : ploceuskey000401a1, ploceuskey000401a2 and ploceuskey000401b1
Three disk encryption set       : ploceuploceusdiskencryptionset000401a1, ploceuploceusdiskencryptionset000401a2 and ploceuploceusdiskencryptionset000401b1
Three key vault access policy   : key_vault_access_policy_1, key_vault_access_policy_2 and key_vault_access_policy_3
Disk encryption Set ploceuploceusdiskencryptionset000401a1 uses the key ploceuskey000401a1
Disk encryption Set ploceuploceusdiskencryptionset000401a2 uses the key ploceuskey000401a2
Disk encryption Set ploceuploceusdiskencryptionset000401b1 uses the key ploceuskey000401b1
Keys ploceuskey000401a1 and ploceuskey000401a2 are in the key vault ploceuskeyvault000401a and ploceuskey000401b1 is in the key vault ploceuskeyvault000401b
ploceuploceusdiskencryptionset000401a1 and ploceuploceusdiskencryptionset000401a2 will have access to key vault ploceuskeyvault000401a.
ploceuploceusdiskencryptionset000401b1 will have access to key vault ploceuskeyvault000401b