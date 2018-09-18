provider "restapi" {
  uri = "https://app.terraform.io/api/v2"
  headers = {
    "Content-Type" = "application/vnd.api+json",
    "Authorization" = "Bearer zOllcz5l0y6KLw.atlasv1.chKxsOAfAwomyGqcwHNPy0GxIzi5XyIlWlzHUs5lQX72CDck2JPco7NkNNnYmQmIevw",
  }
  id_attribute = "name"
  write_returns_object = false
  create_returns_object = false
  debug = true
}

variable "search_value" {
  default = "gcp-compute-instance"
}

data "restapi_object" "tfe_workspace" {
  path = "/organizations/Cloud-Operations/workspaces"
  #id_attribute = "name"
  results_key = "data"
  search_key = "attributes/name"
  search_value = "${var.search_value}"
  debug = true
}

resource "random_pet" "my_pet" {
}

output "workspace_id " {
  value = "${data.restapi_object.tfe_workspace.id}"
}
