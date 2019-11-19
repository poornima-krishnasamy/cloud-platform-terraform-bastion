# cloud-platform-terraform-bastion

Terraform module that will create the bastion inside a VPC that will grant access to internal subnets to the members of the team. It also created a route53 within the route53 hostzone given as a input/parameter. 

## Usage

```hcl
module "bastion" {
  source = "github.com/ministryofjustice/cloud-platform-terraform-bastion?ref=0.0.2"

  vpc_id       = "vpc-1234567890"
  key_name     = "cp-mogaal"
  route53_zone = "${local.cluster_name}.cloud-platform.service.justice.gov.uk"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| vpc_id | The VPC where bastion is going to be deployed | string |  | yes |
| route53_zone | The DNS hostzone where bastion is going to be created, usually is going to be something like bastion.$clusterName.cloud-platform.service.justice.gov.uk. | string | | yes |
| key_name | The key_pair name to be used in the bastion instance | string | | yes |

## Outputs

| Name | Description |
|------|-------------|
| bastion_endpoint | Access key id for s3 account |
| bastion_eip | Arn for s3 bucket created |
