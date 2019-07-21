provider "google" {
  credentials = "${file("./creds/serviceaccount.json")}"
}

module "create_k8_cluster" {
  source     = "./gcluster"
  project    = "${var.project}"
  region     = "${var.region}"
  zone       = "${var.zone}"
  username   = "${var.username}" 
  node_count = "${var.node_count}"
}
