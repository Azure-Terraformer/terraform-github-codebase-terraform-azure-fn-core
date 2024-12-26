# Overview

This Terraform module automates the provisioning of the Azure Function Core environment by setting up essential infrastructure components within a specified GitHub repository and branch. It manages the creation of foundational Terraform configuration files, including main.tf, observability.tf, regions.tf, variables.tf, and versions.tf, ensuring a standardized project structure. 

Additionally, the module configures environment-specific Terraform variable files (terraform.tfvars) and regional stamp modules that provision Azure App Service Plans and Key Vaults. 

The root module establishes a Log Analytics Workspace, an Application Insights instance, and a Key Vault, with the Application Insights secret shared across regional stamps to enable consistent monitoring for all Azure Functions. 

By provisioning these configurations through Terraform and committing them to the GitHub repository, the module ensures consistent, repeatable, and secure deployments of Azure infrastructure, seamlessly integrating within the GitHub AT-AT framework for efficient automation of Terraform and Azure-based projects.