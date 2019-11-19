
variable "cluster_base_domain_name" {
  description = "The DNS hostzone where bastion is going to be created, usually is going to be something like bastion.$clusterName.cloud-platform.service.justice.gov.uk."
  type        = string
}

variable "vpc_id" {
  description = "The vpc_id where the security groups and bastions are going to be created"
  type        = string
}

variable "key_name" {
  description = "The key_pair name to be used in the bastion instance"
  type        = string
}

variable "bastion_depends_on" {
  type    = any
  default = null
}