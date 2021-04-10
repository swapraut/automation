variable "avi_username" {
  type    = string
  default = "admin"
}

variable "avi_controller" {
  type    = string
  default = "10.206.114.182"
}
variable "avi_password" {
  type    = string
  default = "pass1234"
}

variable "avi_tenant" {
  type    = string
  default = "admin"
}

variable "avi_version" {
  type    = string
  default = "18.2.7"
}

variable "avi_cloudname" {
  type    = string
  default = "Default-Cloud"
}

variable "vcenter_password" {
  type    = string
  default = "pass1234"
}

variable "vcenter_username" {
  type    = string
  default = "user1"
}

variable "vcenter_url" {
  type    = string
  default = "foo.vmware.com"
}

variable "vmware_datacenter" {
  type    = string
  default = "wdc-06-vc12"
}

variable "avi_se_mgmt_pg" {
  type    = string
  default = "avi-mgmt"
}

variable "avi_se_mgmt_netmask" {
  type    = number
  default = 22
}

variable "avi_se_mgmt_subnet" {
  type    = string
  default = "10.26.112.0"
}

variable "avi_se_mgmt_start_addr" {
  type    = string
  default = "10.26.112.144"
}

variable "avi_se_mgmt_end_addr" {
  type    = string
  default = "10.26.112.146"
}
