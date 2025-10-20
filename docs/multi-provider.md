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
