# AWS Coding Exercise - Backend setup

This part of the repo is not required by the excercise but allows the user to create the backend per specification and ensures solution completeness.

## Setup for Terraform State

To maintain the state of the environment, we need to create an S3 bucket and a table on DynamoDB.

### Create the Terraform Backend

In short the environment is created like this
- Initialise Terraform
- Execute infrastructure to AWS.

To start the process, open a terminal window in Linux `(CTRL + ALT + t)`.  `cd` into the state folder and initialise the Terraform state environment..
```sh
cd state
terraform init
```

Once complete, check the planned Terraform run is correct..
```sh
terraform plan
```

If all looks good, install the backend infrastructure as planned.
```sh
terraform apply
```

You can now use the main root folder infrastructure code as required.  Full details in the [README.md](../README.md) in the root.