module "azure_firewall_policy" {
  source                    = "../../../firewall-policies/v1.0.0/"
  firewall_policy_variables = var.firewall_policy_variables
}