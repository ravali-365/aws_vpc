# Terraform AWS VPC Configuration
This repository contains detailed Terraform code to provision a Virtual Private Cloud (VPC) in AWS, along with public and private subnets, an EC2 instance, and necessary security configurations. The infrastructure is deployed in the **`eu-north-1`** (Stockholm) region.

---

## 📋 Table of Contents
1. [Architecture Overview](#architecture-overview)  
2. [Key Components](#key-components)  
3. [Pre-requisites](#pre-requisites)  
4. [Terraform Files Description](#terraform-files-description)  
5. [How to Run This Code](#how-to-run-this-code)  
6. [Security Fixes Applied](#security-fixes-applied)  
7. [Outputs](#outputs)  
8. [Clean-Up](#clean-up)  

---

## 🏗️ Architecture Overview
- **VPC CIDR:** `10.0.0.0/16`  
- **Subnets:**
  - **3 Public Subnets:** For resources needing internet access.
  - **3 Private Subnets:** For internal resources without internet access.
- **Internet Gateway:** For outbound traffic from public subnets.
- **Security Groups:** Allows HTTP traffic on port 80.
- **EC2 Instance:** Deployed in a public subnet with a Free Tier eligible AMI.

---

## ⚙️ Why Each Part of the Code Exists

### 1. `provider.tf`
```hcl
provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}
```
- **Purpose:** Specifies AWS provider and region.
- **Why:** Required for Terraform to communicate with AWS API.
- **How:** Uses access and secret keys stored securely.

---

### 2. `versions.tf`
```hcl
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
```
- **Purpose:** Locks Terraform and AWS provider versions.
- **Why:** Ensures compatibility and avoids breaking changes.
- **How:** Specifies version requirements to prevent conflicts.

---

### 3. `variables.tf`
```hcl
variable "aws_region" {
  default = "eu-north-1"
}
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
```
- **Purpose:** Centralizes configuration.
- **Why:** Enhances reusability and manageability.
- **How:** Uses variables for VPC CIDR, subnets, and instance types.

---

### 4. `main.tf`
```hcl
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
}
```
- **Purpose:** Core resource definitions.
- **Why:** Defines VPC, subnets, and EC2 instance setup.
- **How:** Leverages variables for flexible deployment.

---

### 5. `terraform.tfvars`
```hcl
aws_region    = "eu-north-1"
aws_access_key = "YOUR_ACCESS_KEY"
aws_secret_key = "YOUR_SECRET_KEY"
```
- **Purpose:** Provides actual values for variables.
- **Why:** Separates sensitive data from main code.
- **How:** Stores access keys and region.

---

### 6. `outputs.tf`
```hcl
output "vpc_id" {
  value = aws_vpc.my_vpc.id
}
```
- **Purpose:** Displays key information after deployment.
- **Why:** Simplifies resource verification.
- **How:** Uses output blocks for VPC ID and public IP.

---


