terraform {
  required_providers {
    btp = {
      source = "SAP/btp"
    }
  }
}

locals {
  service_name_prefix = lower(replace("${var.project_stage}-${var.project_name}", " ", "-"))
}

resource "btp_subaccount_entitlement" "alert_notification_service_standard" {
  subaccount_id = var.subaccount_id
  service_name  = "alert-notification"
  plan_name     = "standard"
}

resource "btp_subaccount_entitlement" "feature_flags_service_lite" {
  subaccount_id = var.subaccount_id
  service_name  = "feature-flags"
  plan_name     = "lite"
}

resource "btp_subaccount_entitlement" "feature_flags_dashboard_app" {
  subaccount_id = var.subaccount_id
  service_name  = "feature-flags-dashboard"
  plan_name     = "dashboard"
}

data "btp_subaccount_service_plan" "alert_notification_service_standard" {
  subaccount_id = var.subaccount_id
  name          = "standard"
  offering_name = "alert-notification"
  depends_on    = [btp_subaccount_entitlement.alert_notification_service_standard]
}

resource "btp_subaccount_service_instance" "alert_notification_service_standard" {
  subaccount_id  = var.subaccount_id
  serviceplan_id = data.btp_subaccount_service_plan.alert_notification_service_standard.id
  name           = "${local.service_name_prefix}-alert-notification"
}

resource "btp_subaccount_subscription" "feature_flags_dashboard_app" {
  subaccount_id = var.subaccount_id
  app_name      = "feature-flags-dashboard"
  plan_name     = "dashboard"
  depends_on    = [btp_subaccount_entitlement.feature_flags_dashboard_app]
}