# AWS Coding Exercise

Welcome to the documentation for the coding exercise for Enivata.
The aim is of this documentation is to be as accurate, brief and usable as possible.  Setups are considered for Linux terminal only.

## Setup for AWS / Terraform

These are the basic instructions for setting up AWS and Terraform and then running the infrastructure as requried in the exercise.

- [Install the Terraform CLI](#install-terraform) - Skip this if you already have this installed.
- [Create an AWS Account](#create-an-aws-account) - Skip this if you already have this installed.
- [Create the Terrform state backend](state/README.md#install-terraform) - Skip this if you already have this installed or is not needed.
- [Create the Terraform infrastructure](#create-the-terraform-infrastructure) - Run the infrastructure.

### Install Terraform

Use the following console commands to install the PGP keys for Hashicorp and then install the Terraform CLI.
```sh
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform
```
Source : https://learn.hashicorp.com/tutorials/terraform/install-cli

### Create an AWS Account
Set up your AWS Acount [here](https://docs.aws.amazon.com/polly/latest/dg/setting-up.html) and get your Access and Secret keys [here](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html).  Keep them ready for later in this document, as you'll need them to build the infrastructure without authentication.

### Create the Terrform state backend
Skip this if you already have this installed or is not needed.  [Click here](state/README.md#install-terraform) if you need to install the backend.

### Create the Terraform infrastructure
In short, the environment is created like this..
- Clone the exercise repo from Github
- Set some environment variables
- Initialise Terraform
- Execute infrastructure to AWS.

To start the process, open a terminal window in Linux (CTRL + ALT + t).  Once open, clone the `codeshop` repo and cd into the `terraform` directory as shown below..
```sh
cd
git clone git@github.com:clicktechnology/codeshop.git
cd codeshop
cd terraform
```

Now, we need to set your AWS access key and AWS secret key into your environment variables to pass to Terraform when it runs.  This allows the Terraform CLI to run without pasword authentication.
```sh
set TF_VAR_aws_access_key="YOUR_ACCESS_KEY_UMUU"
set TF_VAR_aws_secret_key="YOUR_AWS_SECRET_KEY_8QLC4vPkyQtCAfosheXm"
```
Check the environment variables are now set..

```sh
export | grep TF_VAR
```

Now you can initialise the Terraform environment..
```sh
terraform init
```

Once complete, check the planned Terraform run is correct..
```sh
terraform plan
```

If all looks good, install the infrastructure as planned.
```sh
terraform apply
```

Once the run is finished and the infrastructure is created, you can check it out through the web console in the [VPC section of the AWS Web Console](https://console.aws.amazon.com/vpc/home?region=us-east-1).  NB : If you can't see any VPC infrastructure, but the run seemed to complete, make sure you are looking at the US East (N. Virginia) region, set in the top right hand corner.
Once complete, the Terraformed infrastructure can be removed using the _destroy_ subcommand, like this..
```sh
terraform destroy
```
