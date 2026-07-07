# Terraform AWS DevOps Infrastructure

## Overview

This project provisions a complete AWS infrastructure using Terraform following Infrastructure as Code (IaC) principles.

The architecture consists of a public frontend server running Apache HTTP Server and a private backend server hosted inside a private subnet. The backend is isolated from the internet while still being able to access external repositories through a NAT Gateway.

---

## Architecture

```
                   Internet
                       │
               Internet Gateway
                       │
              Public Route Table
                       │
               Public Subnet
                       │
          Frontend EC2 (Apache)
                       │
             Frontend Security Group
                       │
        -------------------------------
                       │
              Private Route Table
                       │
                 NAT Gateway
                       │
               Private Subnet
                       │
          Backend EC2 (Private)
                       │
             Backend Security Group
```

---

## AWS Services Used

- Amazon VPC
- Public & Private Subnets
- Internet Gateway
- NAT Gateway
- Elastic IP
- Route Tables
- Security Groups
- EC2
- Amazon Linux 2023
- Apache HTTP Server
- Terraform

---

## Features

- Infrastructure as Code using Terraform
- Public and Private Network Architecture
- Secure Backend Deployment
- Automatic Apache Installation using User Data
- Security Group based communication
- Internet access for private subnet using NAT Gateway
- Terraform Outputs

---

## Project Structure

```
terraform/
│
├── provider.tf
├── ami.tf
├── vpc.tf
├── nat-gateway.tf
├── private-route-table.tf
├── security-group.tf
├── ec2.tf
├── output.tf
└── .terraform.lock.hcl
```

---

## Deployment

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

---

## Outputs

Terraform prints:

- Frontend Public IP
- Frontend URL
- Backend Private IP
- VPC ID

---

## Skills Demonstrated

- AWS Networking
- Terraform
- Infrastructure as Code
- VPC Design
- EC2 Provisioning
- Security Groups
- NAT Gateway
- Route Tables
- Linux Automation
- Apache Web Server

---

## Author

**Pritam Priyanshu Patra**

GitHub:
https://github.com/PritamPriyanshuPatra2003
