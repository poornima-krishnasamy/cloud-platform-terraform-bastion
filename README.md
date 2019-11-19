# cloud-platform-terraform-bastion

Terraform module that will create the bastion inside a VPC that will grant access to internal subnets to the members of the team

## Usage

```hcl
module "bastion" {
  source = "github.com/ministryofjustice/cloud-platform-terraform-bastion"

  vpc_id                   = "vpc-1234567890"
  cluster_base_domain_name = "${local.cluster_name}.cloud-platform.service.justice.gov.uk"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| vpc_id | The VPC where bastion is going to be deployed | string |  | yes |
| cluster_base_domain_name | The DNS hostzone where bastion is going to be created, usually is going to be something like bastion.$clusterName.cloud-platform.service.justice.gov.uk. | string | | yes |

## Outputs

| Name | Description |
|------|-------------|
| bastion_endpoint | Access key id for s3 account |
| bastion_eip | Arn for s3 bucket created |

