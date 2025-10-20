# Update a Terraform Provider

## Goal 🎯

The goal of this file is to document the update process of a Terraform provider

## References 📝
- [Lock and upgrade provider versions](https://developer.hashicorp.com/terraform/tutorials/configuration-language/provider-versioning)

## XXXX 🛠️

## Explore provider.tf
Open the provider.tf file. Here you will find the terraform block which specifies the required provider version and required Terraform version for this configuration.

```terraform
terraform {
  required_providers {
    btp = {
      source  = "SAP/btp"
      version = "~> 1.15.0"
    }
  }
}
```

## Explore terraform.lock.hcl 🛠️
When you initialize a Terraform configuration for the first time with Terraform 1.1 or later, Terraform will generate a new `.terraform.lock.hcl` file in the current working directory.

For example the block with the SAP BTP provider:
```terraform
provider "registry.terraform.io/sap/btp" {
  version     = "1.15.1"
  constraints = "~> 1.15.0"
```

 The BTP provider version is v1.15.1. This fulfills the ~>=1.15.1 constraint, but is no longer the latest version of the BTP provider. 

> [!NOTE]
> For the SAP BTP (Business Technology Platform) Terraform provider, constraints = "~> 1.15.0" specifies a version range in your Terraform config. It requires the provider (source: SAP/btp) to use version >= 1.15.0 but < 2.0.0—allowing compatible patch/minor updates (e.g., 1.15.1 or 1.16.0) for bug fixes/features without major breaking changes. 

## Upgrade the SAP BTP Provider Version 🛠️

```bash
  terraform init -upgrade
```
The -upgrade flag will upgrade all providers to the latest version consistent within the version constraints specified in your configuration.



Open the `.terraform.lock.hcl` file and notice that the AWS provider's version is now the latest version.
