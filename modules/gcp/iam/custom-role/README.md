## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.53 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 3.53 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_project_iam_custom_role.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_custom_role) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | (Optional) A human-readable description for the role. | `string` | `""` | no |
| <a name="input_permissions"></a> [permissions](#input\_permissions) | (Optional) The project that the service account will be created in. Defaults to the provider project configuration. | `list(string)` | `[]` | no |
| <a name="input_role_id"></a> [role\_id](#input\_role\_id) | (Required) The camel case role id to use for this role. Cannot contain - characters. | `string` | n/a | yes |
| <a name="input_stage"></a> [stage](#input\_stage) | (Optional) The current launch stage of the role. Defaults to GA. List of possible stages is here. | `string` | `"GA"` | no |
| <a name="input_title"></a> [title](#input\_title) | (Required) A human-readable title for the role. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_deleted"></a> [deleted](#output\_deleted) | The current deleted state of the role. |
| <a name="output_description"></a> [description](#output\_description) | A human-readable description for the role. |
| <a name="output_id"></a> [id](#output\_id) | an identifier for the resource with the format projects/{{project}}/roles/{{role\_id}} |
| <a name="output_name"></a> [name](#output\_name) | The name of the role in the format projects/{{project}}/roles/{{role\_id}}. Like id, this field can be used as a reference in other resources such as IAM role bindings. |
| <a name="output_permissions"></a> [permissions](#output\_permissions) | The names of the permissions this role grants when bound in an IAM policy. At least one permission must be specified. |
| <a name="output_project"></a> [project](#output\_project) | The project that the service account will be created in. Defaults to the provider project configuration. |
| <a name="output_role_id"></a> [role\_id](#output\_role\_id) | The camel case role id to use for this role. Cannot contain - characters. |
| <a name="output_stage"></a> [stage](#output\_stage) | The current deleted state of the role. |
| <a name="output_title"></a> [title](#output\_title) | A human-readable title for the role. |
