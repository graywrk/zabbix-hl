terraform {
  required_providers {
    ah = {
      source = "advancedhosting/ah"
      version = "0.1.3"
    }
  }
}

provider "ah" {
  access_token = var.ah_access_token
}

resource "ah_private_network" "private_network" {
  ip_range = var.ah_private_network_ip_range
  name = "Private network"
}

resource "ah_cloud_server" "entrypoint" {
  name = "entrypoint"
  datacenter = var.ah_default_dc
  image = var.ah_base_image
  product = var.ah_default_product
  use_password = var.ah_default_use_password
  ssh_keys = var.ah_ssh_keys
  create_public_ip_address = true
}

resource "ah_private_network_connection" "entrypoint" {
  cloud_server_id = ah_cloud_server.entrypoint.id
  private_network_id = ah_private_network.private_network.id
  ip_address = "${var.ah_private_network_ip_start_with}1"
}

resource "ah_cloud_server" "patroni_postgresql" {
  count = var.patroni_postgresql_instances
  name = "patroni_postgresql${count.index + 1}"
  datacenter = var.ah_default_dc
  image = var.ah_base_image
  product = var.ah_default_product
  use_password = var.ah_default_use_password
  ssh_keys = var.ah_ssh_keys
  create_public_ip_address = var.ah_default_create_public_ip_address
}

resource "ah_private_network_connection" "patroni_postgresql" {
  count = var.patroni_postgresql_instances
  cloud_server_id = ah_cloud_server.patroni_postgresql[count.index].id
  private_network_id = ah_private_network.private_network.id
  ip_address = "${var.ah_private_network_ip_start_with}${10+count.index}"
}

resource "ah_cloud_server" "patroni_consul" {
  count = var.patroni_consul_instances
  name = "patroni_consul${count.index + 1}"
  datacenter = var.ah_default_dc
  image = var.ah_base_image
  product = var.ah_default_product
  use_password = var.ah_default_use_password
  ssh_keys = var.ah_ssh_keys
  create_public_ip_address = var.ah_default_create_public_ip_address
}

resource "ah_private_network_connection" "patroni_consul" {
  count = var.patroni_consul_instances
  cloud_server_id = ah_cloud_server.patroni_consul[count.index].id
  private_network_id = ah_private_network.private_network.id
  ip_address = "${var.ah_private_network_ip_start_with}${20+count.index}"
}

resource "ah_cloud_server" "patroni_haproxy" {
  count = var.patroni_haproxy_instances
  name = "patroni_haproxy${count.index + 1}"
  datacenter = var.ah_default_dc
  image = var.ah_base_image
  product = var.ah_default_product
  use_password = var.ah_default_use_password
  ssh_keys = var.ah_ssh_keys
  create_public_ip_address = var.ah_default_create_public_ip_address
}

resource "ah_private_network_connection" "patroni_haproxy" {
  count = var.patroni_haproxy_instances
  cloud_server_id = ah_cloud_server.patroni_haproxy[count.index].id
  private_network_id = ah_private_network.private_network.id
  ip_address = "${var.ah_private_network_ip_start_with}${30+count.index}"
}

resource "ah_cloud_server" "zabbix_server" {
  count = var.zabbix_server_instances
  name = "zabbix_server${count.index + 1}"
  datacenter = var.ah_default_dc
  image = var.ah_base_image
  product = var.ah_default_product
  use_password = var.ah_default_use_password
  ssh_keys = var.ah_ssh_keys
  create_public_ip_address = var.ah_default_create_public_ip_address
}

resource "ah_private_network_connection" "zabbix_server" {
  count = var.zabbix_server_instances
  cloud_server_id = ah_cloud_server.zabbix_server[count.index].id
  private_network_id = ah_private_network.private_network.id
  ip_address = "${var.ah_private_network_ip_start_with}${40+count.index}"
}

resource "ah_cloud_server" "zabbix_web" {
  count = var.zabbix_web_instances
  name = "zabbix_web${count.index + 1}"
  datacenter = var.ah_default_dc
  image = var.ah_base_image
  product = var.ah_default_product
  use_password = var.ah_default_use_password
  ssh_keys = var.ah_ssh_keys
  create_public_ip_address = var.ah_default_create_public_ip_address
}

resource "ah_private_network_connection" "zabbix_web" {
  count = var.zabbix_web_instances
  cloud_server_id = ah_cloud_server.zabbix_web[count.index].id
  private_network_id = ah_private_network.private_network.id
  ip_address = "${var.ah_private_network_ip_start_with}${50+count.index}"
}

resource "ah_cloud_server" "zabbix_haproxy" {
  count = var.zabbix_haproxy_instances
  name = "zabbix_haproxy${count.index + 1}"
  datacenter = var.ah_default_dc
  image = var.ah_base_image
  product = var.ah_default_product
  use_password = var.ah_default_use_password
  ssh_keys = var.ah_ssh_keys
  create_public_ip_address = var.ah_default_create_public_ip_address
}

resource "ah_private_network_connection" "zabbix_haproxy" {
  count = var.zabbix_haproxy_instances
  cloud_server_id = ah_cloud_server.zabbix_haproxy[count.index].id
  private_network_id = ah_private_network.private_network.id
  ip_address = "${var.ah_private_network_ip_start_with}${60+count.index}"
}
