# Setup a GitHub Codespace for Terraform

## Goal 🎯

The goal of this file is to document the setup of a Github Codespace for Terraform

## References 📝
- [Quickstart for GitHub Codespaces](https://docs.github.com/en/codespaces/quickstart)
- [Adding features to a devcontainer.json file](https://docs.github.com/en/codespaces/setting-up-your-project-for-codespaces/configuring-dev-containers/adding-features-to-a-devcontainer-file)

## Create Code Space 🛠️

### Create standard Terraform Codespace for a Repository
On GitHub, navigate to the main page of the repository. Click the Code button, then click the Codespaces tab. Click `Create codespace on main`.

<img width="1190" height="613" alt="image" src="https://github.com/user-attachments/assets/c69fc880-10a9-465b-b1db-d916526380d4" />


Use the Command Palette (Ctrl + Shift + P) or F1) and select `Codespaces: Add Dev Container Configuration Files`.
  
<img width="1446" height="158" alt="image" src="https://github.com/user-attachments/assets/054eea87-6dae-4068-9d41-006c01e7f254" />

Select a container configuration template such as `Ubuntu`.

> [!Note]
> When setting up a GithHub Code for Terraform , the Ubuntu template is often recommended as the base for your devlopment container because it provides a lightweight, flexible, and widely compatible Linux enviroment that aligns well with Terraform's requirements.

<img width="1473" height="315" alt="image" src="https://github.com/user-attachments/assets/ace1e76d-04f6-4ea3-b17f-60f3003aff62" />

Select a feature for Terraform such as `Terraform, tflint, and TFGrunt devcontainers`. See [Terraform, tflint, and TFGrunt (terraform)](https://github.com/devcontainers/features/tree/main/src/terraform) for more information.

Use the Command Palette (Ctrl + Shift + P) or F1) and select `Rebuild Container`. Verify that you can use Terraform now using for example the command:

```terraform
terraform version
```

<img width="1109" height="272" alt="image" src="https://github.com/user-attachments/assets/c35ae32b-b151-4ac6-9467-265fd3a58f70" />


