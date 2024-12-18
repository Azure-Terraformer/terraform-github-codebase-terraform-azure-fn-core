
locals {
  modules_folder_files = [
    "main.tf",
    "variables.tf",
    "versions.tf"
  ]
}


resource "github_repository_file" "modules_folder" {

  count = length(local.modules_folder_files)

  repository          = var.repository
  branch              = var.branch
  file                = "${var.path}/modules/regional-stamp/${local.modules_folder_files[count.index]}"
  content             = file("${path.module}/files/modules/regional-stamp/${local.modules_folder_files[count.index]}.t4")
  commit_message      = "Managed by Terraform"
  commit_author       = var.commit_user.name
  commit_email        = var.commit_user.email
  overwrite_on_create = true
}


locals {
  root_folder_files = [
    "main.tf",
    "terraform.tfvars",
    "variables.tf",
    "versions.tf"
  ]
}

resource "github_repository_file" "root_folder" {

  count = length(local.root_folder_files)

  repository          = var.repository
  branch              = var.branch
  file                = "${var.path}/${local.root_folder_files[count.index]}"
  content             = file("${path.module}/files/${local.root_folder_files[count.index]}.t4")
  commit_message      = "Managed by Terraform"
  commit_author       = var.commit_user.name
  commit_email        = var.commit_user.email
  overwrite_on_create = true
}

resource "github_repository_file" "gitignore" {

  repository          = var.repository
  branch              = var.branch
  file                = ".gitignore"
  content             = file("${path.module}/files/.gitignore")
  commit_message      = "Managed by Terraform"
  commit_author       = var.commit_user.name
  commit_email        = var.commit_user.email
  overwrite_on_create = true

}
