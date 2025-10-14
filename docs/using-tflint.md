# TFLint

## Goal 🎯

TFLint is an open-source, pluggable static analysis tool and linter specifically designed for Terraform configurations in Infrastructure as Code (IaC) projects. It acts as a framework that inspects .tf files (and related files like .tfvars) to detect potential errors, enforce best practices, identify deprecated syntax, unused declarations, and provider-specific issues (e.g., invalid AWS instance types) that Terraform's built-in validate command might miss

## References 📝
- []()


In your Codespace terminal, verify TFLint is available:

```bash
tflint --version
```

Run TFLint with default generic ruleset:

```bash
tflint
```

Example Output:

<img width="1244" height="600" alt="image" src="https://github.com/user-attachments/assets/0b0a1f08-567a-4701-bd6b-fd95354b5c78" />
