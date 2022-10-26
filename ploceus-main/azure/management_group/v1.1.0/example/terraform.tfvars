management_group_variables = {
  "Father01" = {
    name                         = "ploceusmg00001"
    parent_management_group_name = null #incase of parent define as null
    subscription_id              = []
    level_number                 = 1
  },
  "Child02" = {
    name                         = "ploceusmg00002"
    parent_management_group_name = "ploceusmg00001"
    subscription_id              = []
    level_number                 = 2
  }
  "Child01" = {
    name                         = "ploceusmg00003"
    parent_management_group_name = "ploceusmg00001"
    subscription_id              = []
    level_number                 = 2

  },
  "Father02" = {
    name                         = "ploceusmg00004"
    parent_management_group_name = null #incase of parent define as null
    subscription_id              = []
    level_number                 = 1
  },
  "Child03" = {
    name                         = "ploceusmg00005"
    parent_management_group_name = "ploceusmg00004"
    subscription_id              = []
    level_number                 = 2
  }
  "Child04" = {
    name                         = "ploceusmg00006"
    parent_management_group_name = "ploceusmg00004"
    subscription_id              = []
    level_number                 = 2
  },
  "Grandchild01" = {
    name                         = "ploceusmg00007"
    parent_management_group_name = "ploceusmg00006"
    subscription_id              = []
    level_number                 = 3
  }
}
