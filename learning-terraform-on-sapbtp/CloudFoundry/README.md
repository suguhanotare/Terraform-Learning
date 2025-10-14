<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_cloudfoundry"></a> [cloudfoundry](#requirement\_cloudfoundry) | 1.8.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudfoundry"></a> [cloudfoundry](#provider\_cloudfoundry) | 1.8.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudfoundry_space.project_space](https://registry.terraform.io/providers/cloudfoundry/cloudfoundry/1.8.0/docs/resources/space) | resource |
| [cloudfoundry_space_role.space_developer](https://registry.terraform.io/providers/cloudfoundry/cloudfoundry/1.8.0/docs/resources/space_role) | resource |
| [cloudfoundry_space_role.space_manager](https://registry.terraform.io/providers/cloudfoundry/cloudfoundry/1.8.0/docs/resources/space_role) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cf_api_url"></a> [cf\_api\_url](#input\_cf\_api\_url) | The Cloud Foundry API URL | `string` | n/a | yes |
| <a name="input_cf_org_id"></a> [cf\_org\_id](#input\_cf\_org\_id) | The Cloud Foundry organization ID | `string` | n/a | yes |
| <a name="input_cf_space_developer"></a> [cf\_space\_developer](#input\_cf\_space\_developer) | The Cloud Foundry space developer | `string` | n/a | yes |
| <a name="input_cf_space_manager"></a> [cf\_space\_manager](#input\_cf\_space\_manager) | The Cloud Foundry space manager | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the project | `string` | `"Project ABC"` | no |
| <a name="input_subaccount_stage"></a> [subaccount\_stage](#input\_subaccount\_stage) | Stage of the subaccount | `string` | `"DEV"` | no |
| <a name="input_subaccount_url"></a> [subaccount\_url](#input\_subaccount\_url) | The SAP BTP subaccount URL | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cf_space_url"></a> [cf\_space\_url](#output\_cf\_space\_url) | The Cloud Foundry space URL |
<!-- END_TF_DOCS -->