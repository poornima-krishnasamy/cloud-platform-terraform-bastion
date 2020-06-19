
variable "route53_zone" {
  description = "The DNS hostzone where bastion is going to be created, usually is going to be something like bastion.$clusterName.cloud-platform.service.justice.gov.uk."
  type        = string
}

variable "vpc_name" {
  description = "The vpc_name where the security groups and bastions are going to be created"
  type        = string
}

variable "cluster_domain_name" {
  description = "Domain name is used to generate key_pair name to be used in the bastion instance"
  type        = string
}
