# Display a Terraform Dependency Graph

## Goal 🎯

The goal of this file is to document the how to display a Terraform Dependency Graph

## References 📝
- [Graphviz Online](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&ved=2ahUKEwiWjuvP4LmQAxWA0gIHHYyPMIUQFnoECBsQAQ&url=https%3A%2F%2Fdreampuf.github.io%2FGraphvizOnline%2F&usg=AOvVaw2Sw6OnaIb_oZkOtu44VcNz&opi=89978449)

## Create a Dependency Graph 🛠️
1. Enter the following command in the terminal:
 
    ```bash
    terraform graph
    ```
2. Copy the generated output and enter it in the Online Renderer Graphviz.
   <img width="2147" height="456" alt="image" src="https://github.com/user-attachments/assets/59c2fbf8-188e-4c34-a04f-8ee17096b915" />

4. View Result




Example Code:
```terraform
digraph G {
  rankdir = "RL";
  node [shape = rect, fontname = "sans-serif"];
  "data.btp_globalaccount.this" [label="data.btp_globalaccount.this"];
  "data.btp_subaccount_environments.all" [label="data.btp_subaccount_environments.all"];
  "btp_subaccount.project_subaccount" [label="btp_subaccount.project_subaccount"];
  "btp_subaccount_environment_instance.cloudfoundry" [label="btp_subaccount_environment_instance.cloudfoundry"];
  "btp_subaccount_role_collection_assignment.emergency_administrators" [label="btp_subaccount_role_collection_assignment.emergency_administrators"];
  "random_uuid.uuid" [label="random_uuid.uuid"];
  "terraform_data.cf_landscape_label" [label="terraform_data.cf_landscape_label"];
  subgraph "cluster_module.srvc_baseline" {
    label = "module.srvc_baseline"
    fontname = "sans-serif"
    "module.srvc_baseline.data.btp_subaccount_service_plan.alert_notification_service_standard" [label="data.btp_subaccount_service_plan.alert_notification_service_standard"];
    "module.srvc_baseline.btp_subaccount_entitlement.alert_notification_service_standard" [label="btp_subaccount_entitlement.alert_notification_service_standard"];
    "module.srvc_baseline.btp_subaccount_entitlement.feature_flags_dashboard_app" [label="btp_subaccount_entitlement.feature_flags_dashboard_app"];
    "module.srvc_baseline.btp_subaccount_entitlement.feature_flags_service_lite" [label="btp_subaccount_entitlement.feature_flags_service_lite"];
    "module.srvc_baseline.btp_subaccount_service_instance.alert_notification_service_standard" [label="btp_subaccount_service_instance.alert_notification_service_standard"];
    "module.srvc_baseline.btp_subaccount_subscription.feature_flags_dashboard_app" [label="btp_subaccount_subscription.feature_flags_dashboard_app"];
  }
  "data.btp_subaccount_environments.all" -> "btp_subaccount.project_subaccount";
  "btp_subaccount.project_subaccount" -> "random_uuid.uuid";
  "btp_subaccount_environment_instance.cloudfoundry" -> "terraform_data.cf_landscape_label";
  "btp_subaccount_role_collection_assignment.emergency_administrators" -> "btp_subaccount.project_subaccount";
  "terraform_data.cf_landscape_label" -> "data.btp_subaccount_environments.all";
  "module.srvc_baseline.data.btp_subaccount_service_plan.alert_notification_service_standard" -> "module.srvc_baseline.btp_subaccount_entitlement.alert_notification_service_standard";
  "module.srvc_baseline.btp_subaccount_entitlement.alert_notification_service_standard" -> "btp_subaccount.project_subaccount";
  "module.srvc_baseline.btp_subaccount_entitlement.feature_flags_dashboard_app" -> "btp_subaccount.project_subaccount";
  "module.srvc_baseline.btp_subaccount_entitlement.feature_flags_service_lite" -> "btp_subaccount.project_subaccount";
  "module.srvc_baseline.btp_subaccount_service_instance.alert_notification_service_standard" -> "module.srvc_baseline.data.btp_subaccount_service_plan.alert_notification_service_standard";
  "module.srvc_baseline.btp_subaccount_subscription.feature_flags_dashboard_app" -> "module.srvc_baseline.btp_subaccount_entitlement.feature_flags_dashboard_app";
}
```
