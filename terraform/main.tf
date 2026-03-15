# terraform/main.tf
terraform {
  required_providers { oci = { source = "oracle/oci" } google = { source = "hashicorp/google" } }
}

variable "oracle_tenancy_ocid" {}  # secrets

module "oracle_oke" {
  source = "../modules/oracle"  # Free A1.Flex
  # ...
}
# Add GCP GKE nano, Azure AKS B1s, AWS EKS t4g
resource "null_resource" "federate" { depends_on = [module.oracle_oke] }  # Post-hook
