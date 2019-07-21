resource "google_container_cluster" "guestbook" {
  name               = "${var.project}"
  zone               = "${var.zone}"
  initial_node_count = "${var.node_count}"

  
  master_auth {
    username = "${var.username}"
    password = "${random_string.password.result}"
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/trace.append",
      "https://www.googleapis.com/auth/compute",
    ]
  }
}


resource "random_string" "password" {
  length = 16
  upper  = true
  lower  = true
  special = true
  number = true
}


output "cluster_endpoint" {
  value     = "${google_container_cluster.guestbook.endpoint}"
}
