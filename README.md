# devops-intervieiw

## Requirements:
- AWS CLI installed
- AWS SSM plugin installed
- Docker installed
- GIT installed
- Terraform Installed
- RDP client installed
- IDE of your choice

## Objectives:

### 1
- Deploy a .NET Core API and angular UI to AWS EC2 instances, ensuring that applications are accessible through an URI hosted in the provided route53 through the internal Application Load Balancer (ALB) and that the UI is pointing to the API address. You will be provided with AWS credentials to complete this task.
- the API must be available thorugh api.internal.interview.com
- the UI must be available throygh ui.internal.interview.com
- IMPORTANT! Since we want to see your understanding of AWS and Terraform, the use of external terraform modules is not allowed!

### 2
- A Windows EC2 instance will be deployed in the AWS account, make sure the application deployed is accessible thorugh that instance 
- After deploying the application and confirming it is accessible, use AWS Systems Manager (SSM) to forward the RDP port. Access the Windows instance via RDP to verify the application’s availability.

## Infrastructure Setup:

- Setup Terraform using your credentials and backing up the state file on the S3 provided by the interviwer
- Use Terraform to deploy the infrastructure.

## Application Deployment:

- Use the provided Dockerfile to build and run the API and UI on the respective EC2 instances.
- Create two EC2 instances:
  - One instance for hosting the Project.API.
  - One instance for hosting the Project.UI.
- For Objective 1, manual steps are allowed for debugging, but the applications must run automatically after executing the Terraform scripts, with no further manual intervention.
- Objective 2 is to be achieved manually through the AWS console and CLI.

## Terraform Details:

- You will find a Terraform script for the VPC and subnet setup. Use this to deploy your EC2 instances.

## Deliverables:

- Terraform module files (main.tf, variables.tf, outputs.tf, etc.).

## Additional Notes:
- Follow security best practices when setting up the security groups (e.g., only allowing necessary ports and IP ranges).
- Ensure the Terraform configuration is modular, reusable, and follows best practices.
- Research is encouraged, but the use of AI is prohibited.
