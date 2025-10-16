# Setup Auditlog Viewer Service via Terraform

## Goal 🎯

The goal of this file is to document the setup and deployment of the SAP BTP Audit Log Viewer Service on a BTP Subaccount via Terraform

## References 📝
- [Terraform Provider for SAP BTP](https://registry.terraform.io/providers/SAP/btp/latest/docs)
- [btp_subaccount_entitlement (Resource)](https://registry.terraform.io/providers/SAP/btp/latest/docs/resources/subaccount_entitlement)
- [btp_subaccount_subscription (Resource)](https://registry.terraform.io/providers/SAP/btp/latest/docs/resources/subaccount_subscription)
- [btp_subaccount_role_collection (Resource)](https://registry.terraform.io/providers/SAP/btp/latest/docs/resources/subaccount_role_collection)

## Create Entitlement for the Audit Log Viewer Service 🛠️
As we want to add entitlements in our newly created subaccount, the fitting resource is [`btp_subaccount_entitlement`](https://registry.terraform.io/providers/SAP/btp/latest/docs/resources/subaccount_entitlement). Looking at the required attributes we see that we basically need the `subaccount_id`, the `service_name` and the `plan_name`. The list of services does not have a numerical quota, so that's all we need.

Add the entitlement by adding the following code to the `main.tf` file:

```terraform
resource "btp_subaccount_entitlement" "Audit_Log_Viewer_Service_Free" {
  subaccount_id = var.subaccount_id
  service_name  = "auditlog-viewer"
  plan_name     = "free"
}
```
