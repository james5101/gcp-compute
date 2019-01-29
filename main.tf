provider "google" {
 credentials = "${file("k8s-node-224301-737b6d94efa1.json")}"
 project     = "k8s-node-224301"
 region      = "us-east1"
}

module "test_gcp_server" {
  source = "./module"
  vm_name = "james-gcp-ubuntu"
  
}
