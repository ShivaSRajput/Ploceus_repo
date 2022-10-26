
locals {
  level1_management_groups = { for k, v in var.management_group_variables : k => v if v.level_number == 1 }
  level2_management_groups = { for k, v in var.management_group_variables : k => v if v.level_number == 2 }
  level3_management_groups = { for k, v in var.management_group_variables : k => v if v.level_number == 3 }
  level4_management_groups = { for k, v in var.management_group_variables : k => v if v.level_number == 4 }
  level5_management_groups = { for k, v in var.management_group_variables : k => v if v.level_number == 5 }
  level6_management_groups = { for k, v in var.management_group_variables : k => v if v.level_number == 6 }
}

#Azure Parent Management Group Data
data "azurerm_management_group" "parent_management_group_lv1" {
  for_each = local.level2_management_groups
  name     = each.value.parent_management_group_name
  depends_on = [
    azurerm_management_group.management_groups_level1
  ]
}

data "azurerm_management_group" "parent_management_group_lv2" {
  for_each = local.level3_management_groups
  name     = each.value.parent_management_group_name
  depends_on = [
    azurerm_management_group.management_groups_level2
  ]
}

data "azurerm_management_group" "parent_management_group_lv3" {
  for_each = local.level4_management_groups
  name     = each.value.parent_management_group_name
  depends_on = [
    azurerm_management_group.management_groups_level3
  ]
}

data "azurerm_management_group" "parent_management_group_lv4" {
  for_each = local.level5_management_groups
  name     = each.value.parent_management_group_name
  depends_on = [
    azurerm_management_group.management_groups_level4
  ]
}

data "azurerm_management_group" "parent_management_group_lv5" {
  for_each = local.level6_management_groups
  name     = each.value.parent_management_group_name
  depends_on = [
    azurerm_management_group.management_groups_level5
  ]
}


#Management Group Level 1
resource "azurerm_management_group" "management_groups_level1" {
  for_each                   = local.level1_management_groups
  name                       = each.value.name
  display_name               = each.value.name
  parent_management_group_id = null
  subscription_ids           = each.value.subscription_id
}

#Management Group Level 2
resource "azurerm_management_group" "management_groups_level2" {
  for_each                   = local.level2_management_groups
  name                       = each.value.name
  display_name               = each.value.name
  parent_management_group_id = data.azurerm_management_group.parent_management_group_lv1[each.key].id
  subscription_ids           = each.value.subscription_id
  depends_on                 = [azurerm_management_group.management_groups_level1]

}

#Management Group Level 3
resource "azurerm_management_group" "management_groups_level3" {
  for_each                   = local.level3_management_groups
  name                       = each.value.name
  display_name               = each.value.name
  parent_management_group_id = data.azurerm_management_group.parent_management_group_lv2[each.key].id
  subscription_ids           = each.value.subscription_id
  depends_on                 = [azurerm_management_group.management_groups_level2]
}

#Management Group Level 4
resource "azurerm_management_group" "management_groups_level4" {
  for_each                   = local.level4_management_groups
  name                       = each.value.name
  display_name               = each.value.name
  parent_management_group_id = data.azurerm_management_group.parent_management_group_lv3[each.key].id
  subscription_ids           = each.value.subscription_id
  depends_on                 = [azurerm_management_group.management_groups_level3]
}

#Management Group Level 5
resource "azurerm_management_group" "management_groups_level5" {
  for_each                   = local.level5_management_groups
  name                       = each.value.name
  display_name               = each.value.name
  parent_management_group_id = data.azurerm_management_group.parent_management_group_lv4[each.key].id
  subscription_ids           = each.value.subscription_id
  depends_on                 = [azurerm_management_group.management_groups_level4]
}

#Management Group Level 6
resource "azurerm_management_group" "management_groups_level6" {
  for_each                   = local.level6_management_groups
  name                       = each.value.name
  display_name               = each.value.name
  parent_management_group_id = data.azurerm_management_group.parent_management_group_lv5[each.key].id
  subscription_ids           = each.value.subscription_id
  depends_on                 = [azurerm_management_group.management_groups_level5]
}
