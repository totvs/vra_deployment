# Import VRealize provider
terraform {
  required_providers {
    vra = {
      source  = "vmware/vra"
    }
  }
  required_version = ">= 0.13"
}

# Add new Deployment

resource "vra_deployment" "deployment" {
  for_each = var.deployment_spec
  
  name        = each.value["deployment_name"]
  description = each.value["description"]

  catalog_item_id      = each.value["catalog_item_id"]
  catalog_item_version = each.value["catalog_item_version"]
  project_id           = each.value["project_id"]

  inputs = {
    MachineName = each.value["deployment_name"]
    backup = each.value["backup"]
    description = each.value["description"]
    rede = each.value["environment"]
    tamanho = each.value["flavor"]
    users = each.value["vm_username"]
    domain_vm = each.value["vm_domain"]
    disks = each.value["disks"]
  }
  
  timeouts {
    create = "30m"
    delete = "30m"
    update = "30m"
  }
}


