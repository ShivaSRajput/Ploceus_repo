# Sentinel Watchlist Item  OUTPUTS
output "sentinel_watchlist_item_ids" {
  description = "The ID of the Sentinel Watchlist Item"
  value       = { for k, v in azurerm_sentinel_watchlist_item.sentinel_watchlist_item : k => v.id }
}
