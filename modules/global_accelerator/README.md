# global_accelerator
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_globalaccelerator_accelerator.globalaccelerator](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/globalaccelerator_accelerator) | resource |
| [aws_globalaccelerator_endpoint_group.globalaccelerator_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/globalaccelerator_endpoint_group) | resource |
| [aws_globalaccelerator_listener.globalaccelerator_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/globalaccelerator_listener) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_globalaccelerator_enabled"></a> [globalaccelerator\_enabled](#input\_globalaccelerator\_enabled) | Indicates whether the accelerator is enabled. Defaults to `true`. | `bool` | `true` | no |
| <a name="input_globalaccelerator_endpoint_configuration_weight"></a> [globalaccelerator\_endpoint\_configuration\_weight](#input\_globalaccelerator\_endpoint\_configuration\_weight) | Listener endpoint group configuration weight. | `number` | `100` | no |
| <a name="input_globalaccelerator_endpoint_group_region"></a> [globalaccelerator\_endpoint\_group\_region](#input\_globalaccelerator\_endpoint\_group\_region) | Listener endpoint group regions. | `list(string)` | <pre>[<br>  "us-west-1"<br>]</pre> | no |
| <a name="input_globalaccelerator_health_check_interval_seconds"></a> [globalaccelerator\_health\_check\_interval\_seconds](#input\_globalaccelerator\_health\_check\_interval\_seconds) | Listener endpoint group health check interval in seconds | `number` | `30` | no |
| <a name="input_globalaccelerator_health_check_port"></a> [globalaccelerator\_health\_check\_port](#input\_globalaccelerator\_health\_check\_port) | Listener endpoint group health check port. | `number` | `80` | no |
| <a name="input_globalaccelerator_health_check_protocol"></a> [globalaccelerator\_health\_check\_protocol](#input\_globalaccelerator\_health\_check\_protocol) | Listener endpoint group health check protoc in seconds | `string` | `"TCP"` | no |
| <a name="input_globalaccelerator_listener_client_affinity"></a> [globalaccelerator\_listener\_client\_affinity](#input\_globalaccelerator\_listener\_client\_affinity) | Listener Client affinity | `string` | `"NONE"` | no |
| <a name="input_globalaccelerator_listener_from_port"></a> [globalaccelerator\_listener\_from\_port](#input\_globalaccelerator\_listener\_from\_port) | Listener from port number | `number` | `80` | no |
| <a name="input_globalaccelerator_listener_protocol"></a> [globalaccelerator\_listener\_protocol](#input\_globalaccelerator\_listener\_protocol) | Listener protocol | `string` | `"TCP"` | no |
| <a name="input_globalaccelerator_listener_to_port"></a> [globalaccelerator\_listener\_to\_port](#input\_globalaccelerator\_listener\_to\_port) | Listener to port number | `number` | `80` | no |
| <a name="input_globalaccelerator_name"></a> [globalaccelerator\_name](#input\_globalaccelerator\_name) | The name of the accelerator | `string` | `"test-global-acceleraror"` | no |
| <a name="input_globalaccelerator_tag_name"></a> [globalaccelerator\_tag\_name](#input\_globalaccelerator\_tag\_name) | Tag of the global accelerator | `string` | `"test-global-acceleraror"` | no |
| <a name="input_globalaccelerator_threshold_count"></a> [globalaccelerator\_threshold\_count](#input\_globalaccelerator\_threshold\_count) | Listener endpoint group threshold count. | `number` | `3` | no |
| <a name="input_globalaccelerator_traffic_dial_percentage"></a> [globalaccelerator\_traffic\_dial\_percentage](#input\_globalaccelerator\_traffic\_dial\_percentage) | Listener endpoint group traffic dial percentage. | `number` | `100` | no |
| <a name="input_load_balancer_arn"></a> [load\_balancer\_arn](#input\_load\_balancer\_arn) | Load balancer arn | `list(string)` | `[]` | no |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
