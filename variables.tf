variable "deployment_spec" {
  type = map(object({
    catalog_item_id      = string
    catalog_item_version = string
    project_id           = string
    deployment_name      = string
    backup               = string
    description          = string
    vm_password          = string
    environment          = string
    flavor               = string
    vm_username          = string
    vm_domain            = string
    count_disks          = number
    size_disk2           = number
  }))
  description = "Specs of Deployments"
}
