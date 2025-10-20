# Setup CloudFoundry & Manage Provider Dependencies

## Goal 🎯

The goal of this file is to document the Multi Provider Setup of BTP & CloudFoundry. However there is one downside of the provider configuration that comes into our way here: the configuration can only consist of static values that are known from the start. While we could provide this value as a variable there is currently no way to provide this value dynamically during Terraform execution. Consequently, we must split the configuration and add a dedicated new provider setup for the Cloud Foundry specifics.

> [!NOTE]
> This downside is not specific for the setup on SAP BTP, but is also the case for other cloud providers. In the case of Kubernetes it is even recommended to split the provisioning of the cluster from further action in the cluster to avoid unwanted side effects.

## References 📝
- [XXX](XXXX)

## Providing the Static Values from the BTP Directory to the Cloud Foundry Directory 🛠️
Provide required values for `cf_api_url` and `cf_org_id` based on the output of the values for the Cloud Foundry API URL and the organization ID from the BTP directory.

> [!TIP]
> You can use the `terraform output` command to get access to the values.

The `terraform.tfvars` file then looks like this:

```terraform
cf_api_url         = "https://api.cf.us10-00x.hana.ondemand.com"
cf_org_id          = "<ID CLOUD FOUNDRY ORG>"
subaccount_url     = "<URL of SAP BTP subaccount>"
```

Terraform can't dynamically use values between the BTP and Cloud Foundry providers because it needs all provider settings (like API URLs or credentials) to be set before it starts creating resources. Here's why this is a problem:

The BTP provider creates things like a Cloud Foundry environment, which gives you outputs (like the API endpoint or org ID) only after it's created.
The Cloud Foundry provider needs those outputs (e.g., API endpoint) in its configuration to work, but Terraform requires this configuration to be ready before it runs anything.

Since the BTP provider's outputs aren't available until after it runs, the Cloud Foundry provider can't use them directly in the same Terraform setup.
Simple Fix
You need to split the process into two steps:

1. Step 1: Use the BTP provider to create the Cloud Foundry environment and save the outputs (like API endpoint and org ID).
2. Step 2: Use those saved outputs in a separate Terraform configuration for the Cloud Foundry provider. You can:
    - Manually copy the outputs into a file (like terraform.tfvars).
    - Use a tool like Terraform's terraform_remote_state to grab the outputs.
    - Use automation tools (like Terramate or scripts) to run these steps in order and pass the values.

This way, you create the BTP resources first, then use their outputs to set up the Cloud Foundry provider. It’s a bit manual but works around Terraform’s limitation. Check the SAP BTP provider’s documentation for examples on setting up Cloud Foundry environments.
