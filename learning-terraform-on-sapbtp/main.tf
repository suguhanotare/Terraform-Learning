resource "btp_subaccount" "project_subaccount" {
  name         = "DEV Project Terraform"
  subdomain    = "dev-project-terraform"
  region       = "us10"
  beta_enabled = true
  labels = {
    "stage"      = ["DEV"]
    "costcenter" = ["12345"]
  }
}