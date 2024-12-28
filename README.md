# AWS VPC Architecture with Terraform

## Description
This Terraform project creates a secure and scalable AWS Virtual Private Cloud (VPC) architecture.
It includes public and private subnets, an EC2 instance, an RDS database, and proper route table configurations.
The Terraform state is stored in an S3 bucket with DynamoDB for state locking.

## Architectural Diagram
<img src="./images/architecture.png" width="100%" height="100%" alt="Architectural Diagram">


## Architecture Overview
This architecture consists of the following components:
1. **VPC**: A customer Virtual Private Cloud with a defined CIDR block.
2. **Public Subnet**: Hosts an EC2 instance and allows internet access through an Internet Gateway.
3. **Private Subnet**: Hosts an Amazon RDS database, isolated from public internet access.
4. **Route Tables**:
   - Public route table for internet traffic, associated with the public subnet.
   - Private route table for internal communication within the private subnet.
5. **EC2 Instance**: A web server hosted in the public subnet.
6. **RDS Database**: A MySQL database hosted in the private subnet.
7. **Backend Configuration**: The Terraform state is stored in an S3 bucket with DynamoDB for state locking to ensure collaborative workflows.

## Pre-requisites
1. **Terraform Installed**: Install Terraform from the [*official website*](https://developer.hashicorp.com/terraform/install).
2. **AWS CLI Installed**: Install the [*AWS CLI*](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) and configure your credentials using ```aws configure```.
3. **IAM User/Role Permissions**:
   - Access to create VPC, subnets, EC2, RDS, S3, DynamoDB, and route tables.
   - Permissions for the S3 bucket and DynamoDB table (for state storage and locking).

## Usage
1. Clone the Repository
```shell
git clone https://github.com/CalebAckom/ec2-bastion-rds.git
```

2. Provision Backend resource
- Change Directory
```shell
cd init
```
- Initialize Terraform
```shell
terraform init
```
- Plan Infrastructure

This is used to review the changes Terraform will apply
```shell
terraform plan
```
- Apply Changes

This will provision the infrastructure
```shell
terraform apply
```

3. Provision other Infrastructure

In the same terminal, run:
```shell
cd ..
```

Repeat the process for ```init```, ```plan```, and ``apply```.

4. View Outputs

After applying, view the created resources:
```shell
terraform output
```

## Resources Created
1. VPC
   - CIDR Block: 10.0.0.0/16
2. Subnets
   - Public Subnet: 10.0.1.0/24
   - Private Subnet A: 10.0.16.0/24
   - Private Subnet B: 10.0.32.0/24
3. Route Table
4. Internet Gateway
5. EC2 Instance
6. RDS Database
7. S3 Bucket: Used for storing the Terraform state file
8. DynamoDB Table: Used for state locking

## Clean Up
To destroy the infrastructure:
```shell
terraform destroy
```
