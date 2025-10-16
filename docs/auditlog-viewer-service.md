# Setup Auditlog Viewer Service via Terraform

## Goal 🎯

The goal of this file is to document the setup and deployment of the SAP BTP Audit Log Viewer Service on a BTP Subaccount via Terraform

## References 📝
- [Terraform Provider for SAP BTP](https://registry.terraform.io/providers/SAP/btp/latest/docs)
- [btp_subaccount_entitlement (Resource)](https://registry.terraform.io/providers/SAP/btp/latest/docs/resources/subaccount_entitlement)
- [btp_subaccount_subscription (Resource)](https://registry.terraform.io/providers/SAP/btp/latest/docs/resources/subaccount_subscription)
- [btp_subaccount_role_collection (Resource)](https://registry.terraform.io/providers/SAP/btp/latest/docs/resources/subaccount_role_collection)

### Create Entitlement for the Audit Log Viewer Service 🛠️
As we want to add entitlements in our newly created subaccount, the fitting resource is [`btp_subaccount_entitlement`](https://registry.terraform.io/providers/SAP/btp/latest/docs/resources/subaccount_entitlement). Looking at the required attributes we see that we basically need the `subaccount_id`, the `service_name` and the `plan_name`. The list of services does not have a numerical quota, so that's all we need.

Add the entitlement by adding the following code to the `srvc_baseline.tf` file in the module directory `modules/srvc-baseline`.

```terraform
resource "btp_subaccount_entitlement" "Audit_Log_Viewer_Service_Free" {
  subaccount_id = var.subaccount_id
  service_name  = "auditlog-viewer"
  plan_name     = "free"
}
```

### Create Subscription to the Audit Log Viewer Service 🛠️
The provisioning of resources by Terraform is executed in parallel. By default 10 resources are provisioned in parallel. When setting up the execution plan Terraform will consider dependencies between resources if it can detect them. The detection is possible whenever an attribute of a resource is used by another resource as attribute value.

Looking at our configuration we see that the ID of the subaccount is used all over the place. Consequently, Terraform knows that it must provision the btp_subaccount resource first, before working on the other resources that use the ID. However, there is no such connection between the entitlement and subscription. Here we must tell Terraform there is a explicit dependency that it must take into account when creating the execution plan. We achieve this by the meta argument [`depends_on`](https://developer.hashicorp.com/terraform/language/meta-arguments/depends_on). In this argument we can specify the address of the resource that the annotated resource depends on.

Add the subscription by adding the following code to the `srvc_baseline.tf` file in the module directory `modules/srvc-baseline`.

```terraform
# create a subscription to audit log viewer application
resource "btp_subaccount_subscription" "auditlog_viewer_app" {
  subaccount_id = var.subaccount_id
  app_name      = "auditlog-viewer"
  plan_name     = "free"
  depends_on = [ btp_subaccount_entitlement.Audit_Log_Viewer_Service_Free ]
}
```

### Create Subscription to the Audit Log Viewer Service 🛠️
Add the creation of the role collection by adding the following code to the srvc_baseline.tf file in the module directory modules/srvc-baseline.

```terraform
resource "btp_subaccount_role_collection" "audit_log_auditor" {
  subaccount_id = var.subaccount_id
  name          = "Audit_log_Auditor"
  description   = "View the auditlog."
  roles = [
    {
      name                 = "Auditlog_Auditor"
      role_template_app_id = "auditlog-management!b1187"
      role_template_name   = "Auditlog_Auditor"
    },
    {
      name                 = "Auditlog_Auditor"
      role_template_app_id = "auditlog-viewer!t1187"
      role_template_name   = "Auditlog_Auditor"
    },
  ]
  depends_on = [ btp_subaccount_subscription.auditlog_viewer_app ]
}
```
