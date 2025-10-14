# Terraform Documentation

## Goal 🎯

Terraform Docs (often referred to as terraform-docs) is a tool used to automatically generate documentation for Terraform configurations. It scans Terraform module code (written in HashiCorp Configuration Language, HCL) and produces formatted documentation, typically in Markdown, that describes the module's inputs, outputs, providers, resources, and other components. This helps maintain clear, up-to-date documentation for infrastructure-as-code projects, making it easier for teams to understand and use Terraform modules.

## References 📝
- [Automating Terraform Documentation with terraform-docs](https://medium.com/google-cloud/automating-terraform-documentation-with-terraform-docs-b708a266aff8)

## Create Terraform Documentation 🛠️

### Terraform Documentation Example
The README.md file in the module directory will be updated with a Markdown table containing documentation for inputs (variables), outputs, resources, and other module details.

```bash
terraform-docs markdown table --output-file README.md --output-mode inject </path/to/module>
```

for example:

```bash
terraform-docs markdown table --output-file README.md --output-mode inject /workspaces/ubiquitous-spoon/learning-terraform-on-sapbtp/BTP
```



---

# Example of generated documentation

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_btp"></a> [btp](#requirement\_btp) | ~> 1.15.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_btp"></a> [btp](#provider\_btp) | 1.15.1 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.7.2 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_srvc_baseline"></a> [srvc\_baseline](#module\_srvc\_baseline) | ./modules/srvc-baseline | n/a |

## Resources

| Name | Type |
|------|------|
| [btp_subaccount.project_subaccount](https://registry.terraform.io/providers/SAP/btp/latest/docs/resources/subaccount) | resource |
| [btp_subaccount_environment_instance.cloudfoundry](https://registry.terraform.io/providers/SAP/btp/latest/docs/resources/subaccount_environment_instance) | resource |
| [btp_subaccount_role_collection_assignment.emergency_administrators](https://registry.terraform.io/providers/SAP/btp/latest/docs/resources/subaccount_role_collection_assignment) | resource |
| [random_uuid.uuid](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/uuid) | resource |
| [terraform_data.cf_landscape_label](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/resources/data) | resource |
| [btp_globalaccount.this](https://registry.terraform.io/providers/SAP/btp/latest/docs/data-sources/globalaccount) | data source |
| [btp_subaccount_environments.all](https://registry.terraform.io/providers/SAP/btp/latest/docs/data-sources/subaccount_environments) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cf_landscape_label"></a> [cf\_landscape\_label](#input\_cf\_landscape\_label) | The Cloud Foundry landscape (format example us10-001). | `string` | `""` | no |
| <a name="input_globalaccount"></a> [globalaccount](#input\_globalaccount) | Subdomain of the global account | `string` | n/a | yes |
| <a name="input_project_costcenter"></a> [project\_costcenter](#input\_project\_costcenter) | Cost center of the project | `string` | `"12345"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the project | `string` | `"Project ABC"` | no |
| <a name="input_subaccount_emergency_admins"></a> [subaccount\_emergency\_admins](#input\_subaccount\_emergency\_admins) | List of emergency admins for the SAP BTP subaccount | `list(string)` | `[]` | no |
| <a name="input_subaccount_region"></a> [subaccount\_region](#input\_subaccount\_region) | Region of the subaccount | `string` | `"us10"` | no |
| <a name="input_subaccount_stage"></a> [subaccount\_stage](#input\_subaccount\_stage) | Stage of the subaccount | `string` | `"DEV"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cf_api_url"></a> [cf\_api\_url](#output\_cf\_api\_url) | The Cloud Foundry API URL |
| <a name="output_cf_landscape_label"></a> [cf\_landscape\_label](#output\_cf\_landscape\_label) | The Cloud Foundry landscape label |
| <a name="output_cf_org_id"></a> [cf\_org\_id](#output\_cf\_org\_id) | The Cloud Foundry organization ID |
| <a name="output_subaccount_url"></a> [subaccount\_url](#output\_subaccount\_url) | The SAP BTP subaccount URL |
<!-- END_TF_DOCS -->
