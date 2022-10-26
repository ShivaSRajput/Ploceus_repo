# Sentinel Watchlist OUTPUTS
output "sentinel_watchlist_ids" {
  description = "The ID of the Sentinel Watchlist"
  value       = { for k, v in azurerm_sentinel_watchlist.sentinel_watchlist : k => v.id }
}
