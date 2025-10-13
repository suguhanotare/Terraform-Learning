<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_btp"></a> [btp](#provider\_btp) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [btp_subaccount_entitlement.alert_notification_service_standard](https://registry.terraform.io/providers/SAP/btp/latest/docs/resources/subaccount_entitlement) | resource |
| [btp_subaccount_entitlement.feature_flags_dashboard_app](https://registry.terraform.io/providers/SAP/btp/latest/docs/resources/subaccount_entitlement) | resource |
| [btp_subaccount_entitlement.feature_flags_service_lite](https://registry.terraform.io/providers/SAP/btp/latest/docs/resources/subaccount_entitlement) | resource |
| [btp_subaccount_service_instance.alert_notification_service_standard](https://registry.terraform.io/providers/SAP/btp/latest/docs/resources/subaccount_service_instance) | resource |
| [btp_subaccount_subscription.feature_flags_dashboard_app](https://registry.terraform.io/providers/SAP/btp/latest/docs/resources/subaccount_subscription) | resource |
| [btp_subaccount_service_plan.alert_notification_service_standard](https://registry.terraform.io/providers/SAP/btp/latest/docs/data-sources/subaccount_service_plan) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the project | `string` | `"Project ABC"` | no |
| <a name="input_project_stage"></a> [project\_stage](#input\_project\_stage) | Stage of the project | `string` | `"DEV"` | no |
| <a name="input_subaccount_id"></a> [subaccount\_id](#input\_subaccount\_id) | The subaccount ID | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->