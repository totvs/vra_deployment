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
    password = each.value["vm_password"]
    rede = each.value["environment"]
    tamanho = each.value["flavor"]
    username = each.value["vm_username"]
    disks = each.value["extra_disks"]
  }
  
  timeouts {
    create = "300m"
    delete = "300m"
    update = "300m"
  }
}


