// main.tf
resource "google_folder" "some_folder" {
  display_name = var.folder_display_name
  parent       = "organizations/${var.organization_id}"
}

resource "google_project" "gcp_project" {
  name       = "Some Project"
  project_id = var.project_id
  folder_id  = google_folder.some_folder.name
}