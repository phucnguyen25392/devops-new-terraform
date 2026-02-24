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
| [google_project_iam_binding.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_binding) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_condition"></a> [condition](#input\_condition) | (Optional) An IAM Condition for a given binding | `list(any)` | `[]` | no |
| <a name="input_members"></a> [members](#input\_members) | An email address that represents a specific Google account. For example, alice@gmail.com or joe@example.com. | `list(string)` | `[]` | no |
| <a name="input_project"></a> [project](#input\_project) | (Required) The project id of the target project. This is not inferred from the provider. | `string` | n/a | yes |
| <a name="input_role"></a> [role](#input\_role) | (Required except for google\_project\_iam\_audit\_config) The role that should be applied. Only one google\_project\_iam\_binding can be used per role. Note that custom roles must be of the format [projects\|organizations]/{parent-name}/roles/{role-name} | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_condition"></a> [condition](#output\_condition) | An IAM Condition for a given binding. |
| <a name="output_etag"></a> [etag](#output\_etag) | (Computed) The etag of the project's IAM policy. |
| <a name="output_id"></a> [id](#output\_id) | an identifier for the resource with format projects/{{project}}/roles/{{role}} |
| <a name="output_members"></a> [members](#output\_members) | Identities that will be granted the privilege in role. |
| <a name="output_project"></a> [project](#output\_project) | The project id of the target project. This is not inferred from the provider. |
| <a name="output_role"></a> [role](#output\_role) | The role that should be applied. Only one google\_project\_iam\_binding can be used per role. Note that custom roles must be of the format [projects\|organizations]/{parent-name}/roles/{role-name}. |
