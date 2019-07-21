variable "cluster_name" {
  default = "mstakx-jishnu"
  description = "This is the name of the cluster that's going to be created"
}

variable "zone" {
  default = "europe-west1-b"
}

variable "node_count" {
  default = 3
  description = "This is the number of nodes in the cluster"
}

variable "username" {
  default = "admin"
}

variable "project" {
  default = "mstakx-jishnu"
}

variable "region" {
  default = "europe-west1"
}
