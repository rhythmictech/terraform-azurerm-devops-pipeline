

module "azure_pipeline" {
  source = "../../"

  org                          = var.org
  project                      = var.project
  name                         = var.name
  github_personal_access_token = var.github_personal_access_token
}
