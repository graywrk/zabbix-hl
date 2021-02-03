variable "ah_access_token" {
	description = "AdvancedHosting API token"
}

variable "ah_private_network_ip_range" {
	description = "AdvancedHosting private network ip range"
}

variable "ah_private_network_ip_start_with" {
	description = "AdvancedHosting private network start ip address (10.0.70.)"
}

variable "ah_base_image" {
	description = "AdvancedHosting default OS image"
}

variable "ah_default_dc" {
	description = "AdvancedHosting default data center"
}

variable "ah_default_product" {
	description = "AdvancedHosting default product"
}

variable "ah_default_use_password" {
	description = "AdvancedHosting use SSH password (default no)"
}

variable "ah_ssh_keys" {
	description = "Fingerprint SSH keys"
}

variable "ah_default_create_public_ip_address" {
	description = "AdvancedHosting create public ip address (default no)"
}

variable "patroni_consul_instances" {
  description = "Number of instances for Consul (for Patroni)"
  type        = number
  default     = 3
}

variable "patroni_postgresql_instances" {
	description = "Number of instances for Postgresql (for Patroni)"
	type = number
	default = 3
}

variable "patroni_haproxy_instances" {
	description = "Number of instances for HAProxy (for Patroni)"
	type = number
	default = 2
}

variable "zabbix_server_instances" {
	description = "Number of instances for Zabbix server"
	type = number
	default = 3
}

variable "zabbix_web_instances" {
	description = "Number of instances for Zabbix web"
	type = number
	default = 3
}

variable "zabbix_haproxy_instances" {
	description = "Number of instances for Haproxy (for zabbix web)"
	type = number
	default = 2
}