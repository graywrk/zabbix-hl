data "ah_cloud_servers" "all_servers" {

}

data "ah_cloud_servers" "entrypoint" {
	filter {
		key = "name"
		values = ["entrypoint"]
	}
}

output "vm_data" {
  value = [data.ah_cloud_servers.all_servers.cloud_servers[*].name,
           data.ah_cloud_servers.all_servers.cloud_servers[*].ips[*].ip_address,
           data.ah_cloud_servers.all_servers.cloud_servers[*].private_networks[*].ip,
           data.ah_cloud_servers.all_servers.cloud_servers[*].vcpu, 
           data.ah_cloud_servers.all_servers.cloud_servers[*].ram,
           data.ah_cloud_servers.all_servers.cloud_servers[*].disk]
}

resource "local_file" "AnsibleInventory" {
	content = templatefile("inventory.tmpl",
	{
		entrypoint-name = try(data.ah_cloud_servers.entrypoint.cloud_servers[0].name, "")
		entrypoint-ip = try(data.ah_cloud_servers.entrypoint.cloud_servers[0].ips[0].ip_address, "")

		all-hostname = try(data.ah_cloud_servers.all_servers.cloud_servers.*.name, [])
		all-private-ip = try(data.ah_cloud_servers.all_servers.cloud_servers.*.private_networks[0].ip, [])
	}
	)
	filename = "site.inv"
}