resource "null_resource" "az_devops_cli_extension_installed" {
  triggers = {
    trigger_always = timestamp()
  }
  provisioner "local-exec" {
    command = "./${path.module}/az-devops-cli-install.sh"
  }
}

resource "null_resource" "az_devops_cli_configure" {
  depends_on = [null_resource.az_devops_cli_extension_installed]

  triggers = {
    org = var.org
    project = var.project
  }

  provisioner "local-exec" {
    command = "./${path.module}/az-devops-config.sh ${var.org} ${var.project}"
  }
}

resource "null_resource" "az_devops_pipeline" {
  depends_on = [
    null_resource.az_devops_cli_configure,
    null_resource.az_devops_cli_extension_installed  
  ]

  triggers = {
    name = var.name
    org = var.org
    project = var.project
  }

  provisioner "local-exec" {
    command = "./${path.module}/az-devops-pipeline.sh ${var.name}"

    environment = {
      AZURE_DEVOPS_EXT_GITHUB_PAT = var.github_personal_access_token
    }
  }
}