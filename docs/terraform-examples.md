# Terraform Examples of Handy Code Snippets

## Goal 🎯

The goal of this file is to docuement handy Terraform code snippits that you either use straightaway or use as inspiration.

## Using Variables in a Terraform Configuration 🛠️

### Validations

This example is a validation of the variable that can be used for the label Cost Center. Here we probably need to check via a regular expression. Skimming through the documentation for function we have a [regex](https://developer.hashicorp.com/terraform/language/functions/regex) function that provides what we need to evaluate a regular expression. Taking a second look at the documentation we see that the function does not return a boolean value that we need as condition.

Here another function helps us out namely the [can](https://developer.hashicorp.com/terraform/language/functions/can) function that according to its documentation evaluates the given expression and returns a boolean value indicating whether the expression produced a result without any errors.

```terraform
variable "project_costcenter" {
  description = "Cost center of the project"
  type        = string
  default     = "12345"
  validation {
    condition     = can(regex("^[0-9]{5}$", var.project_costcenter))
    error_message = "Cost center must be a 5 digit number"
  }
}
```

## Further References 📝

- [Variables and outputs](https://developer.hashicorp.com/terraform/language/values)
- [Input variables](https://developer.hashicorp.com/terraform/language/values/variables)
- [Input variables - type constraints](https://developer.hashicorp.com/terraform/language/values/variables#type-constraints)
- [Input variables - assigning values](https://developer.hashicorp.com/terraform/language/values/variables#assigning-values-to-root-module-variables)
- [Input variable validation](https://developer.hashicorp.com/terraform/language/validate#input-variable-validation)
- [Terraform functions](https://developer.hashicorp.com/terraform/language/functions)
