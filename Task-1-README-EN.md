# DevOps Project TASK-1: Modular Virtual Machine Creation on AWS with Terraform and Jenkins

## Purpose
This project involves creating modular virtual machines on AWS using Terraform and automating this process with Jenkins. We will use workspaces to set up automatic configurations for different environments such as testing, development, staging, and production.

## Requirements
- AWS account
- Terraform
- Jenkins
- Git and GitHub (or a similar version control system)

## Step-by-Step Tasks

### 1. Setting Up the Project Structure
- **1.1.** Create a repository on GitHub to store your Terraform configurations and Jenkinsfile.
- **1.2.** Clone the repository to your local machine.

### 2. Creating Terraform Files
- **2.1.** Create a Terraform workspace for each environment (test, dev, staging, prod). This allows you to have separate configurations for each environment with a single Terraform setup.
- **2.2.** Define input variables for each environment (e.g., instance type, size, environment name).
- **2.3.** Use output variables to provide details of the created resources (e.g., IP addresses of EC2 instances).

### 3. Installing and Configuring Jenkins
- **3.1.** Set up Jenkins on an EC2 instance.
- **3.2.** Install Terraform on the EC2 instance.
- **3.3.** Create a new pipeline in Jenkins and integrate it with your GitHub repository.

### 4. Creating the Jenkins Pipeline
- **4.1.** Create a `Jenkinsfile` to define your pipeline. The pipeline will first use AWS CLI to create project-specific Key Pairs for the EC2 instances, followed by running Terraform plan and apply commands.
- **4.2.** Add parameters in the pipeline to specify which environment Terraform should run for.
- **4.3.** Set up automatic triggers to run the Jenkins pipeline whenever changes are made on GitHub.

### 5. Testing and Verification
- **5.1.** Run the `terraform apply` command for each environment to verify that your Terraform modules work as expected.
- **5.2.** Check if the EC2 instances have been successfully created.
- **5.3.** Test whether the Jenkins pipeline is functioning correctly and whether it automatically triggers upon changes.

### 6. Documentation and Reporting
- **6.1.** Document each step and configuration used in the project in detail.
- **6.2.** Report any challenges encountered and solutions applied.
- **6.3.** Prepare a report that includes details of the created resources as the final output.
