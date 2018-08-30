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

data "restapi_object" "tfe_workspace" {
  path = "/organizations/Cloud-Operations/workspaces"
  results_key = "data"
  search_key = "attributes/name"
  search_value = "gcp-compute-instance"
  debug = true
}

output "workspace_id " {
  value = "${data.restapi_object.tfe_workspace.id}"
}