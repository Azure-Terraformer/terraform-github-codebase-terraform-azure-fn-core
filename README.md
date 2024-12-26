# Overview

This Terraform module automates the provisioning of the Azure Function Core environment by setting up essential infrastructure components within a specified GitHub repository and branch. It manages the creation of foundational Terraform configuration files, including main.tf, observability.tf, regions.tf, variables.tf, and versions.tf, ensuring a standardized project structure. 

Additionally, the module configures environment-specific Terraform variable files (terraform.tfvars) and regional stamp modules that provision Azure App Service Plans and Key Vaults. 

The root module establishes a Log Analytics Workspace, an Application Insights instance, and a Key Vault, with the Application Insights secret shared across regional stamps to enable consistent monitoring for all Azure Functions. 

By provisioning these configurations through Terraform and committing them to the GitHub repository, the module ensures consistent, repeatable, and secure deployments of Azure infrastructure, seamlessly integrating within the GitHub AT-AT framework for efficient automation of Terraform and Azure-based projects.
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | ~> 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_repository_file.gitignore](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file) | resource |
| [github_repository_file.modules_folder](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file) | resource |
| [github_repository_file.root_folder](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file) | resource |
| [github_repository_file.terraform_tfvars](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_branch"></a> [branch](#input\_branch) | The branch of the GitHub repository where the configuration files will be committed.<br><br>Ensure that the specified branch exists in the repository and that the commit user has the necessary permissions to push changes to it. | `string` | n/a | yes |
| <a name="input_commit_user"></a> [commit\_user](#input\_commit\_user) | The GitHub identity used to commit the workflow YAML file to the repository.<br><br>This includes:<br>- **name**: The name of the user committing the workflow file.<br>- **email**: The email address of the user committing the workflow file.<br><br>Ensure that the provided Git identity has the necessary permissions to push changes to the specified repository and branch. | <pre>object({<br>    name  = string<br>    email = string<br>  })</pre> | n/a | yes |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | The operating system type for the Azure App Service Plan.<br><br>**Valid Values**:<br>- `Windows`<br>- `Linux`<br><br>This setting determines the underlying OS for the App Service Plan, affecting compatibility with certain Azure services and runtime environments. | `string` | n/a | yes |
| <a name="input_path"></a> [path](#input\_path) | The file system path within the repository where the Terraform configuration files and workflows will be stored.<br><br>This path determines the directory structure in the repository, organizing configuration files for better manageability. | `string` | `"src/terraform"` | no |
| <a name="input_primary_location"></a> [primary\_location](#input\_primary\_location) | The primary Azure region where the resources will be deployed.<br><br>**Examples**: `eastus`, `westeurope`, `southeastasia`<br><br>Selecting an appropriate primary location is crucial for optimizing latency, compliance, and availability of your Azure resources. | `string` | n/a | yes |
| <a name="input_repository"></a> [repository](#input\_repository) | The name of the GitHub repository where the Azure Function Core environment configurations will be managed.<br><br>This repository will store the Terraform configuration files and GitHub Actions workflows necessary for provisioning and managing the Azure infrastructure. | `string` | n/a | yes |
| <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days) | The number of days to retain logs and monitoring data in the Log Analytics Workspace.<br><br>**Default**: `30`<br><br>Setting an appropriate retention period helps in managing storage costs and ensuring compliance with data retention policies. | `number` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | The SKU name for the Azure App Service Plan, defining the pricing tier and available features.<br><br>**Examples**: `Y1` (Consumption Plan), `EP1` (Premium Plan)<br><br>Choose a SKU that aligns with your performance requirements and budget. Refer to the [Azure App Service Pricing](https://azure.microsoft.com/en-us/pricing/details/app-service/) for detailed information on available SKUs. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_path"></a> [path](#output\_path) | n/a |
<!-- END_TF_DOCS -->