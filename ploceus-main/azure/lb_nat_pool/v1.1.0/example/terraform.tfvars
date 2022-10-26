lb_natpools = {
  "pool1" = {
    backend_port = 1 # range from 1 to 65535
    floating_ip_enabled = false
    frontend_ip_configuration_name = "allowTCP"
    frontend_port_end = 10 # range from 1 to 65534
    frontend_port_start = 1 # range from 1 to 65534
    idle_timeout_in_minutes = 15 # range between 4 to 30 
    load_balancer_name = "ploceuslb"
    name = "ploceuslbnatpool"
    protocol = "Tcp"
    resource_group_name = "ploceusrg000001"
    tcp_reset_enabled = false
  },
  "pool2" = {
    backend_port = 1 # range from 1 to 65535
    floating_ip_enabled = false
    frontend_ip_configuration_name = "allowUDP"
    frontend_port_end = 10 # range from 1 to 65534
    frontend_port_start = 1 # range from 1 to 65534
    idle_timeout_in_minutes = 15 # range between 4 to 30 
    load_balancer_name = "ploceuslb"
    name = "ploceuslbnatpool"
    protocol = "Udp"
    resource_group_name = "ploceusrg000001"
    tcp_reset_enabled = null
  }
}