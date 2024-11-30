### CE7 Capstone Project Group 3

Team members

- Mohamed Shafiq Bin Ghulam Hussein
- Muhammad Alif Bin Mohd Yusri
- Muhammad Khairularifin Bin Razali
- Dijay Kumar Valautham

------------

### Project Objective:

The goal of this capstone project is to design, implement, and optimize a robust monitoring solution for a simple web application, as part of a Site Reliability Engineering (SRE) initiative. A team of four aspiring cloud infrastructure engineers will collaborate to ensure the application's performance, availability, and scalability through comprehensive monitoring, real-time alerts, and effective incident management. The project aims to leverage best practices in SRE, integrating cutting-edge tools and methodologies to proactively detect issues, maintain uptime, and deliver an exceptional user experience.

------------

### Project Plan:

This capstone project will be executed in three distinct phases to ensure a thorough, scalable, and automated approach to monitoring a simple web application on AWS.

**Phase 1: AWS Console Implementation**

In the first phase, the team will manually create and configure essential AWS resources using the AWS Management Console. These resources will include a Virtual Private Cloud (VPC), Internet Gateway, Subnet, Security Group, EC2 Instance, CloudWatch dashboard, alarms, and more. The goal of this phase is to establish a functional monitoring setup and gain a deeper understanding of the AWS services involved.

![image](https://github.com/user-attachments/assets/4374b7df-daaf-4107-9a67-e946e66d141e)

**Phase 2: Infrastructure as Code with Terraform**

Phase 2 will introduce Terraform to automate the creation and management of the AWS infrastructure. The team will transition from manual configurations to defining resources using Terraform's declarative language. This phase will focus on ensuring that the environment is reproducible, scalable, and easily maintainable through infrastructure as code (IaC).

![image](https://github.com/user-attachments/assets/ef9370ac-bd75-4489-959b-25ec5c13f4d4)

**Phase 3: CI/CD with GitHub Actions**

In the final phase, the team will integrate continuous integration and continuous deployment (CI/CD) pipelines using GitHub Actions. The Terraform code will be pushed to a GitHub repository, enabling automated creation, updating, and destruction of AWS resources. This phase will enhance the team's ability to manage the infrastructure efficiently and ensure that resources are provisioned and decommissioned with minimal manual intervention.

![image](https://github.com/user-attachments/assets/4249283c-a931-42f1-ad81-e9a8e6e2334f)

Each phase will build upon the previous one, creating a seamless transition from manual configuration to automated infrastructure management, ensuring both efficiency and reliability in the project's execution.

------------

### Project Resources and Naming Conventions:

**Platforms**
- AWS Management Console for Phase 1
- Visual Studio Code for Phase 2
- GitHub for Phase 3

**AWS Resources**
- Virtual private cloud (VPC): CE7-Grp3-VPC
- Internet gateway (IGW): CE7-Grp3-IGW
- Subnet: CE7-Grp3-Subnet
- Route Table: CE7-Grp3-RouteTable
- Security Group: CE7-Grp3-SG
- Elastic compute cloud (EC2) Instance: CE7-Grp3-EC2
- CloudWatch dashboard: CE7-Grp3-CloudWatchDashboard

**GitHub**
- Repository: CE7-Grp3-CapstoneProject

------------

### Phase 1: AWS Console Implementation

**Prerequisites**

1. **AWS Account**: Make sure you have an AWS account.
2. **Permissions**: Ensure your AWS user has the required permissions to create resources like VPCs, EC2 instances, security groups, IAM roles, S3 buckets, and so on. You might need the AdministratorAccess policy or specific permissions granted by your AWS admin.

**Step 1: Create a VPC (Virtual Private Cloud)**

1. **Login to AWS Console** and navigate to the **VPC Dashboard**.
2. On the left sidebar, click **Your VPCs** and then click **Create VPC**.
3. Configure the following settings:
- **Name tag**: CE7-Grp3-VPC
- **IPv4 CIDR block**: 10.0.0.0/16
- Leave other settings as default.
4. Click **Create** to create the VPC.

**Step 2: Create an Internet Gateway (IGW)**

1. In the VPC Dashboard, go to **Internet Gateways** in the left sidebar.
2. Click **Create internet gateway**.
3. Enter the following:
- **Name tag**: CE7-Grp3-IGW
4. Click **Create**.
5. After creating the IGW, click on the newly created gateway and choose **Actions > Attach to VPC**.
- Select the VPC you just created (e.g., CE7-Grp3-VPC) and click **Attach**.
