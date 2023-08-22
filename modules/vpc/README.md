# vpc
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a | 

## Resources

| Name | Type |
|------|------|
| [aws_eip.elastic_ip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_internet_gateway.internet_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.nat_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route_table.private_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.public_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.private_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.private_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | A list of availability zones names in the region | `list(string)` | <pre>[<br>  "us-west-1a",<br>  "us-west-1c"<br>]</pre> | no |
| <a name="input_elasticip_name"></a> [elasticip\_name](#input\_elasticip\_name) | Name of the elstic ip. | `string` | `"eip-west1"` | no |
| <a name="input_internet_gateway_name"></a> [internet\_gateway\_name](#input\_internet\_gateway\_name) | Name of the internet gateway. | `string` | `"igw-west1"` | no |
| <a name="input_nat_gateway_name"></a> [nat\_gateway\_name](#input\_nat\_gateway\_name) | Name of the NAT gateway. | `string` | `"nat-west1"` | no |
| <a name="input_private_route_table_name"></a> [private\_route\_table\_name](#input\_private\_route\_table\_name) | Name of the private route table. | `string` | `"route-table-private-west1"` | no |
| <a name="input_private_subnet_cidr"></a> [private\_subnet\_cidr](#input\_private\_subnet\_cidr) | CIDR of the private subnets. | `list(string)` | <pre>[<br>  "10.0.32.0/20",<br>  "10.0.48.0/20"<br>]</pre> | no |
| <a name="input_private_subnet_name"></a> [private\_subnet\_name](#input\_private\_subnet\_name) | Name of the private subnets. | `string` | `"subnet-vpc-1-private"` | no |
| <a name="input_public_route_table_name"></a> [public\_route\_table\_name](#input\_public\_route\_table\_name) | Name of the public route table. | `string` | `"route-table-public-west1"` | no |
| <a name="input_public_subnet_cidr"></a> [public\_subnet\_cidr](#input\_public\_subnet\_cidr) | CIDR of the public subnets. | `list(string)` | <pre>[<br>  "10.0.0.0/20",<br>  "10.0.16.0/20"<br>]</pre> | no |
| <a name="input_public_subnet_name"></a> [public\_subnet\_name](#input\_public\_subnet\_name) | Name of the public subnets. | `string` | `"subnet-vpc-1-public"` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | The IPv4 CIDR block for the VPC. | `string` | `"10.0.0.0/16"` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Name of the VPC. | `string` | `"vpc-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_subnet_id"></a> [private\_subnet\_id](#output\_private\_subnet\_id) | n/a |
| <a name="output_public_subnet_id"></a> [public\_subnet\_id](#output\_public\_subnet\_id) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
