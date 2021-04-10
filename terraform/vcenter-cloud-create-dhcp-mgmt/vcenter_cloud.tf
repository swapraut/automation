provider "avi" {
  avi_username   = var.avi_username
  avi_tenant     = var.avi_tenant
  avi_password   = var.avi_password
  avi_controller = var.avi_controller
  avi_version    = var.avi_version
}

data "avi_tenant" "default_tenant" {
  name = "admin"
}

resource "avi_cloud" "vcenter_cloud" {
    name                               = var.avi_cloudname
    tenant_ref                         = data.avi_tenant.default_tenant.id
    vtype                              = "CLOUD_VCENTER"
    dhcp_enabled                       = true
    vcenter_configuration {
          datacenter                   = var.vmware_datacenter
          password                     = var.vcenter_password
          privilege                    = "WRITE_ACCESS"
          username                     = var.vcenter_username
          vcenter_url                  = var.vcenter_url

          management_ip_subnet {
              mask                     = var.avi_se_mgmt_netmask
              ip_addr {
                  addr                 = var.avi_se_mgmt_subnet
                  type                 = "V4"
                }
            }
        }
}

resource "time_sleep" "wait_20_seconds" {
  depends_on                           = [avi_cloud.vcenter_cloud]
  create_duration                      = "20s"
}

resource "avi_cloud" "vcenter_cloud_2" {
    depends_on                         = [time_sleep.wait_20_seconds]
    name                               = var.avi_cloudname
    tenant_ref                         = data.avi_tenant.default_tenant.id
    vtype                              = "CLOUD_VCENTER"
    dhcp_enabled                       = true
    vcenter_configuration {
          datacenter                   = var.vmware_datacenter
          management_network           = "/api/network?name=${var.avi_se_mgmt_pg}"
          password                     = var.vcenter_password
          privilege                    = "WRITE_ACCESS"
          username                     = var.vcenter_username
          vcenter_url                  = var.vcenter_url

          management_ip_subnet {
              mask                     = var.avi_se_mgmt_netmask
              ip_addr {
                  addr                 = var.avi_se_mgmt_subnet
                  type                 = "V4"
                }
            }
        }
}
