# AWS Coding Exercise

Welcome to the documentation for the coding exercise for Enivata.
The aim is of this documentation is to be as accurate, brief and usable as possible.  Setups are considered for Linux terminal only.

## SSH Keys

take the private key as given, and save it to the ```/home/ansible/.ssh/``` directory as ```id_rsa_deploy```.  In practive, the public key  ```id_rsa_deploy.pub``` would be put there too and uploaded to github under the "Settings", "SSH and GPG keys" menu.

```sh
/home/ansible/.ssh/id_rsa_deploy
```
The private key will be copied during runtime to the EC2 instance and will be used to clone the repo.

## AWS dynamic inventory

To ensure the playbook runs against live, valid EC2 targets, we enable the AWS Dynamic Inventory.

Install Python, Pip and Boto3 if they're not already on board your PC.
```sh
sudo yum install python3 -y
sudo yum -y install python3-pip
sudo pip3 install boto3
```

Create a directory and the aws information file for your AWS settings.

```sh
mkdir -p /opt/ansible/inventory/
touch /opt/ansible/inventory/aws_ec2.yaml
```
Edit `/opt/ansible/inventory/aws_ec2.yaml` and insert the code below, adding in your AWS Access Key and AWS Secret Key.  Set your regions as required.

```yaml
---
plugin: aws_ec2
aws_access_key: ACCESS_KEY_HJMY7UMUU
aws_secret_key: SECRET_KEY_C+JvUNqbK8QLC4vPkyQtCAfosheXm
regions:
  - us-east-1
keyed_groups:
  - key: tags
    prefix: tag
  - prefix: instance_type
    key: instance_type
  - key: placement.region
    prefix: aws_region
```
In your `/etc/ansible/ansible.cfg`, set the following paramters.

```sh
[defaults]
inventory      = /opt/ansible/inventory/aws_ec2.yaml
..
..
[inventory]
enable_plugins = aws_ec2
..
..
```

## Run the playbook

There are assumtions about the target EC2 machines.
 - The `ansible` EC2 account SSH keys are in `/home/ansible/.ssh/`
 - The `ansible` account is a member of the `sudoers` group.  This is `wheel` in EC2 Amazon Linux, so use `sudo usermod -aG wheel ansible` if required.  This is typically part of the build and so should already be in place.

The playbook will run against any machines with the tag Name="my_instance_dev".  Use the command below to run the book and checkout the branch called `feature-2311`.

```sh
ansible-playbook -K deploy.yml --extra-vars "branch=feature-2311"
```
