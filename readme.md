# Terraform AWS VPC Configuration

This repository contains comprehensive Terraform code to provision a Virtual Private Cloud (VPC) in AWS, including public and private subnets, an EC2 instance, security groups, and routing configurations. The infrastructure is deployed in the **`eu-north-1`** (Stockholm) region and follows best practices for security and modularity.

---

## 📋 Table of Contents
1. [Introduction](#introduction)  
2. [Architecture Overview](#architecture-overview)  
3. [Detailed Explanation of Terraform Files](#detailed-explanation-of-terraform-files)  
4. [Step-by-Step Execution](#step-by-step-execution)  
5. [Security Best Practices](#security-best-practices)  
6. [Troubleshooting Common Issues](#troubleshooting-common-issues)  
7. [Clean-Up Instructions](#clean-up-instructions)  


---

## 🛠️ Introduction
This project demonstrates the use of Terraform to manage AWS resources using Infrastructure as Code (IaC). It covers the creation of a VPC with both public and private subnets across multiple availability zones, an EC2 instance, and necessary security configurations. The goal is to provide a scalable and secure network architecture.

---

## 🏗️ Architecture Overview
- **VPC CIDR:** `10.0.0.0/16`
- **Subnets:**
  - 3 Public Subnets for resources requiring internet access.
  - 3 Private Subnets for internal resources without direct internet access.
- **Security Groups:**
  - Allows HTTP traffic on port 80.
  - Allows SSH traffic on port 22.
- **EC2 Instance:**
  - Instance Type: `t3.micro` (Free Tier eligible)
  - AMI: Amazon Linux 2 or a compatible AMI.
- **Internet Gateway and Route Tables:**
  - Manage traffic between public subnets and the internet.

---

## 📂 Detailed Explanation of Terraform Files
### 1. `provider.tf`
Defines the AWS provider and region.
```hcl
provider "aws" {
  region = var.aws_region
}
```
- **Why:** Required to authenticate and communicate with AWS.

### 2. `main.tf`
Contains resources for VPC, subnets, security groups, and EC2 instance.
- **Why:** Organizes all core resources in a single file for clarity.

### 3. `variables.tf`
Defines variables for reusability and modularity.
- **Why:** Simplifies changes and enhances code reusability.

### 4. `terraform.tfvars`
Provides actual values for variables.
- **Why:** Separates configuration from variable declarations.

---

## ⚙️ Step-by-Step Execution
1. **Initialize Terraform:**
```bash
terraform init
```
- **What it does:** Downloads provider plugins and sets up the workspace.

2. **Plan Infrastructure:**
```bash
terraform plan
```
- **Purpose:** Shows a preview of changes.

3. **Apply Configuration:**
```bash
terraform apply
```
- **Purpose:** Deploys resources to AWS.

4. **Verify Resources:** Check AWS console for deployed VPC and EC2.

---

## 🔒 Security Best Practices
- **Environment Variables:** Use for AWS keys to avoid hardcoding.
- **.gitignore:** Excludes `.terraform` and sensitive files.

---

## 🛠️ Troubleshooting Common Issues
1. **Invalid AMI ID:** Ensure the AMI exists in the selected region.
2. **Invalid Instance Type:** Use `t3.micro` for Free Tier eligibility.
3. **Security Group Errors:** Define security groups explicitly.

---

## 🗑️ Clean-Up Instructions
To avoid unnecessary charges, run:
```bash
terraform destroy
```
- **Type `yes`** to confirm.

---

