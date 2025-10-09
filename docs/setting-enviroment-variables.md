### Setting of environment variables

## Setting environment variables for BTP

Setting the values depends on the operating system you are using:

 ```bash
   export BTP_USERNAME=<MY SAP BTP USERNAME>
   export BTP_PASSWORD=<MY SAP BTP PASSWORD>
 ```

> [!IMPORTANT]
> Usually the value for the username is your email. If you have several S- or P-Users in your SAP Universal ID that belong to the same email, use the S- or P-User you use when logging into SAP BTP as username.

> [!NOTE]
> Setting an environment variable like BTP_PASSWORD that contains special characters can be tricky, as some characters (e.g., $, !, ", <, >, &, etc.) have special meanings in shells like Bash, PowerShell, or Command Prompt. Using Single Quotes (Preferred):
> Single quotes (') prevent the shell from interpreting special characters.

You can check the environment variables that you have set with:

```bash
   echo $BTP_USERNAME
   echo $BTP_PASSWORD
 ```

## Setting environment variables for Cloud Foundry

Setting the values depends on the operating system you are using:

 ```bash
   export CF_USER=<MY SAP BTP USERNAME>
   export CF_PASSWORD=<MY SAP BTP PASSWORD>
 ```

> [!NOTE]
> The CloudFoundry user name is the email adress, the password is in the BTP Trail environment with SAP as Identity Provider is the suser password.
