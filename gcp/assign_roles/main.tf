locals {
  roles = [
    "roles/compute.storageAdmin",
    "roles/compute.networkAdmin",
    "roles/compute.securityAdmin"
  ]
}

resource "google_service_account" "compute_admin_sa" {
  account_id   = "${substr(var.env_id, 0, min(length(var.env_id), 10))}-compute-admin-sa"
  display_name = "${var.env_id} Compute Admin SA"
}

resource "google_project_iam_member" "compute_admin_iam_member" {
  for_each = local.roles
  project  = "${var.project_id}"
  role     = each.key
  member   = "serviceAccount:${google_service_account.compute_admin_sa.email}"
  depends_on = [google_service_account.compute_admin_sa]
}