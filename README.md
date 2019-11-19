# cloud-platform-terraform-bastion

Terraform module that will create the bastion inside a VPC that will grant access to internal subnets to the members of the team. It also created a route53 within the route53 hostzone given as a input/parameter. 

## Usage

```hcl
module "bastion" {
  source = "github.com/ministryofjustice/cloud-platform-terraform-bastion?ref=0.0.1"

  vpc_id                   = "vpc-1234567890"
  key_name                 = "cp-mogaal"
  cluster_base_domain_name = "${local.cluster_name}.cloud-platform.service.justice.gov.uk"
  bastion_depends_on       = [aws_route53_zone.cluster.zone_id]
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| vpc_id | The VPC where bastion is going to be deployed | string |  | yes |
| cluster_base_domain_name | The DNS hostzone where bastion is going to be created, usually is going to be something like bastion.$clusterName.cloud-platform.service.justice.gov.uk. | string | | yes |
| key_name | The key_pair name to be used in the bastion instance | string | | yes |
| bastion_depends_on | If bastion depends on some AWS resource then it must be specified here. e.g: route53 hostzone created before the bastion entry | any | | no |

## Outputs

| Name | Description |
|------|-------------|
| bastion_endpoint | Access key id for s3 account |
| bastion_eip | Arn for s3 bucket created |
