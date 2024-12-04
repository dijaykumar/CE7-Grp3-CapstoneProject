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

### Project Cloud Infrastructure Diagram:

PASTE HERE

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

**Step 3: Create a Subnet**

1. In the VPC Dashboard, go to **Subnets** and click **Create subnet**.
2. Configure the subnet:
- **Name tag**: CE7-Grp3-Subnet
- **VPC**: Choose CE7-Grp3-VPC from the drop-down.
- **Availability Zone**: us-east-1a
- **IPv4 CIDR block**: 10.0.1.0/24
- Enable **Auto-assign Public IPv4 Address** to ensure instances launched in this subnet get public IPs.
3. Click **Create**.

**Step 4: Create a Route Table**

1. In the VPC Dashboard, go to **Route Tables** and click **Create route table**.
2. Configure the route table:
- **Name tag**: CE7-Grp3-RouteTable
- **VPC**: Select CE7-Grp3-VPC
3. Click **Create**.
4. Select the route table, go to the **Routes** tab, and click **Edit routes**.
5. Add a route with the following:
- **Destination**: 0.0.0.0/0
- **Target**: Choose the Internet Gateway (CE7-Grp3-IGW).
6. Click **Save routes**.

**Step 5: Associate Route Table with Subnet**

1. Go to the **Subnet Associations** tab of the route table you just created.
2. Click **Edit subnet associations**.
3. Select the subnet (CE7-Grp3-Subnet) you created earlier and click **Save**.

**Step 6: Create a Security Group**

1. In the VPC Dashboard, go to **Security Groups** and click **Create security group**.
2. Configure the security group:
- **Name tag**: CE7-Grp3-SG
- **VPC**: Choose CE7-Grp3-VPC
3. Under **Inbound rules**, click **Edit inbound rules** and add the following:
- **Type**: HTTP
- **Port range**: 80
- **Source**: 0.0.0.0/0
4. Under **Outbound rules**, click **Edit outbound rules** and leave it as default (allow all outbound traffic).
5. Click **Create security group**.

**Step 7: Create an EC2 Instance**

1. In the **EC2 Dashboard**, click **Launch Instance**.
2. Search for and choose the desired **AMI** (e.g., Amazon Linux, Ubuntu).
3. Select the **t2.micro** instance type.
4. Configure the instance:
- **Network**: Select CE7-Grp3-VPC.
- **Subnet**: Select CE7-Grp3-Subnet.
- **Auto-assign Public IP**: Enable.
5. Add Storage if needed (defaults are fine).
6. Add **Tags**. **Name**: CE7-Grp3-EC2
7. Configure **Security Group**:
- Select **Create a new security group**.
- Add the existing **CE7-Grp3-SG** security group created earlier.
8. Add **Key Pair**. Select an existing key pair or create a new one (ensure you download and securely store the private key).
9. In the **Launch Instance** wizard, under **Advanced Details**, paste the contents of the **install_helloworld.sh** script. This will run when the instance starts.
10. Review and **Launch** the instance.

**Step 7: Create a CloudWatch Dashboard to Monitor EC2 Metrics**

1. Navigate to the **CloudWatch Dashboard**.
- In the AWS Console, type **CloudWatch** in the search bar and select CloudWatch from the list of services.
- In the left-hand navigation pane, click on **Dashboards** under the CloudWatch section.
2. Create a **New Dashboard**.
- Click on **Create dashboard** at the top of the CloudWatch Dashboard page.
- In the create new dashboard window, enter **CE7-Grp3-CloudWatchDashboard** as the dashboard name and click **Create dashboard**.

**Step 8: Add Widgets to the Dashboard**

1. In the **Add widget** window, choose **Line** or **Time series** for visualization.
2. Click **Configure** to select the metrics for the widget.
3. Under the **Select metric** tab:
- **Namespace**: Choose AWS/EC2.
- **Metric name**: Choose CPUUtilization.
- **Dimension**: Select InstanceId.
- **InstanceId**: From the EC2 dashboard, get the Instance ID of your EC2 instance (**ce7_grp3_ec2**) that was previously launched.
4. After selecting the correct instance, click **Create widget** to add the CPU Utilization graph to the dashboard.
5. Perform steps 1 to 4 again to add the **Network Traffic** (NetworkIn, NetworkOut) and **Disk Operations** (DiskReadOps, DiskWriteOps) metrics.

**Step 9: Enable VPC Flow Logs and Add Them to CloudWatch Dashboard**

1. In the AWS Console, search for **VPC** and go to the **VPC Dashboard**.
2. In the left-hand sidebar, click on **Your VPCs**. Select the VPC that you created (**CE7-Grp3-VPC**).
3. In the VPC details page, go to the **Flow Logs** tab. Click **Create flow log**.
4. Configure the following options:
- **Filter**: Select All (to capture all traffic).
- **Destination**: Choose Send to CloudWatch Logs.
- **Log group**: Create a new log group or select an existing one (e.g., VPC-Flow-Logs).
- **IAM role**: If it's not already set, create an IAM role with permissions to publish logs to CloudWatch (the AWS-managed policy AWSLogs can be used).
5. Click **Create flow log** to enable VPC Flow Logs for the VPC.
  
6. Navigate to the **CloudWatch Dashboard**. In the CloudWatch dashboard, go to **Dashboards**. Select the dashboard **CE7-Grp3-CloudWatchDashboard** (the one you created earlier).
7. Click **Add widget** on the top-right of the dashboard page and select **Log query** as the widget type.
8. Configure the Log Query Widget:
- **Log Group(s)**: Choose the log group that you created or selected earlier (e.g., VPC-Flow-Logs).
- **Log Query**: You can either write a custom query or use a pre-built one to visualize the flow logs.
- Click **Run query** to preview the results.
9. Choose **Time series**, **Table**, or another visualization and click **Create widget** to add it to your CloudWatch Dashboard.
10. After the widget is added, click **Save dashboard** in the top-right corner.

------------

### Phase 2: Infrastructure as Code with Terraform

**Prerequisites**

1. Download and install **Terraform**. Configure Terraform to your system's **PATH** environment variable.
2. Download and install **AWS CLI**. After installation, open a Command Prompt or PowerShell window and run the **aws configure** command to configure your AWS CLI.

![image](https://github.com/user-attachments/assets/2c64d827-c1bb-4503-bf57-0c886fc9c856)

3. Download and install a **Text Editor** or **IDE** for Writing Terraform Code like **Visual Studio Code** (VS Code). In VS Code, install the **Terraform Extension**.

![image](https://github.com/user-attachments/assets/6fa97168-3009-4be7-87c9-165c2b4a9f32)

**Step 1: Set Up Your Project Structure**

1. Open VS Code and create a **new folder** (e.g., **CE7-Grp3-CapstoneProject**).
2. Inside this folder, create three files as follows:
- **main.tf** (for your main infrastructure resources like VPC, EC2, etc.)
- **cloudwatch.tf** (for your CloudWatch dashboard configuration)
- **scripts/install_helloworld.sh** (for your EC2 user data script)

![image](https://github.com/user-attachments/assets/7acb3f0c-2149-410f-9d0f-133cbe88e9dc)

3. Go to **File** > **Open Folder** and select the folder you just created.

**Step 2: Writing Terraform Code in VS Code**

1. Copy the content of main.tf, cloudwatch.tf, and scripts/install_helloworld.sh uploaded in this repo and paste it into the respective files in VS Code.

**Step 3: Initialize, Plan, and Apply the Terraform Configuration**

1. Initialize the Terraform working directory by opening a **terminal** in VS Code and run the **terraform init** command in your project folder.

![image](https://github.com/user-attachments/assets/305fffeb-ccc8-48dd-b60c-7c71c997eca8)

2. Before applying your changes, you should review the execution plan. In the terminal, run **terraform plan**. This will show you what Terraform plans to create, modify, or destroy.

![image](https://github.com/user-attachments/assets/949080a2-9338-4c19-80ed-ad0baf0880bc)

3. If the plan looks good, apply the configuration by running **terraform apply**. Terraform will ask for confirmation to proceed. Type **yes** to continue.

![image](https://github.com/user-attachments/assets/3900c0e7-e03b-4982-b9b3-3c7e5492ecec)

**Step 4: Manage and Monitor Resources on AWS**

1. Verify that all resources were created on the AWS Management Console.
2. Once your EC2 instance is created, you can access its **public IP** through a browser to view the "**Hello, World!**" message served by Apache.
3. Navigate to **CloudWatch**, and look for the dashboard named "**CE7-Grp3-CloudWatchDashboard**" under **Dashboards**. You should be able to see the EC2 instance metrics from the CloudWatch Dashboard you created.

**Step 5: Clean Up Resources**

1. After verifying the resources created on AWS by Terraform, clean up your environment by running **terraform destroy** in the same VS Code terminal.
2. Terraform will prompt for confirmation before removing the resources.

------------

### Phase 3: CI/CD with GitHub Actions

**Prerequisites**

1. **GitHub Account**.
2. **Git Installed**: Ensure Git is installed on your local system.
3. **AWS Credentials**: You need your AWS **AWS_ACCESS_KEY_ID** and **AWS_SECRET_ACCESS_KEY**.

**Step 1: Initialize the GitHub Repository**

1. Create the GitHub Repository:
- Go to **GitHub** and log in.
- Click the **+ sign** in the top-right corner and select **New repository**.
- Name the repository **CE7-Grp3-CapstoneProject**.
- Set it to **Public** or **Private** depending on your preference.
- Click **Create repository**.

2. Clone the Repository to Your Local Machine:
- Copy the **HTTPS URL** of the repo (e.g., https://github.com/dijaykumar/CE7-Grp3-CapstoneProject).
- Open **Git Bash** (or Command Prompt with Git) on your local machine.
- Navigate to the folder where you want to store your project and run **git clone https://github.com/dijaykumar/CE7-Grp3-CapstoneProject**.

![image](https://github.com/user-attachments/assets/11511c93-7a38-45fd-b1f4-0e6edabd5609)

**Step 2: Move Your Files to the GitHub Repo**

1. Copy all the files (**main.tf**, **cloudwatch.tf**, **scripts/install_helloworld.sh**) from your local Terraform project folder into the cloned GitHub repository folder (**CE7-Grp3-CapstoneProject**).
2. Inside your cloned repo, create a **new folder** for GitHub Actions workflows (**.github/workflows**).
3. Inside .github/workflows folder, create two YAML files for the workflows:
- **create-environment.yml**
- **destroy-environment.yml**
4. Copy and paste the respective codes from the yml files uploaded in this repo using VS Code.

**Step 3: Set Up GitHub Secrets**

1. Navigate to GitHub Secrets:
- Go to your repository on GitHub.
- Click on **Settings** > **Secrets and variables** > **Actions** > **New repository secret**.

2. Add AWS Credentials as Secrets:
- **AWS_ACCESS_KEY_ID**: Your AWS Access Key ID.
- **AWS_SECRET_ACCESS_KEY**: Your AWS Secret Access Key.

![image](https://github.com/user-attachments/assets/d5cfeca5-efad-45df-98b0-2f0b5404707d)

These secrets will be used in the GitHub workflows for authentication with AWS.

**Step 4: Add and Commit the Changes**

1. Add the files to Git:
- Open the **Git Bash** terminal in the project folder.
- **Add** the changes by typing **git add .**

![image](https://github.com/user-attachments/assets/808fd838-6a2a-4001-bdcc-572d608828ce)

2. **Commit** the changes by typing **git commit -m "Initial commit with Terraform files and GitHub Actions workflows"**

![image](https://github.com/user-attachments/assets/a34383b6-d118-4395-817e-f4f0d55738de)

3. **Push** the changes to GitHub by typing **git push origin main**

![image](https://github.com/user-attachments/assets/1b9b4237-e777-48f0-bf37-3ca6cdea0ceb)

**Step 5: Configure Terraform State Management**

1. **Ensure the S3 Bucket Exists**: Verify that your terraform.tfstate will be stored in the bucket sctp-ce7-tfstate in the region us-east-1.
2. **Check IAM Permissions**: The IAM user whose AWS credentials you're using in the GitHub Secrets should have the necessary permissions to read and write to the S3 bucket. The user should also have permission to create, modify, and destroy resources defined in your Terraform configuration.

**Step 6: Test the GitHub Actions Workflows**

1. Trigger the Create Environment Workflow:
- Manually trigger the workflow from GitHub Actions > Run workflow.
- This will start the create-environment.yml workflow to create the resources in AWS.
- Verify the resources by checking the AWS console to ensure the resources (VPC, Subnet, EC2, etc.) have been created as expected.

![image](https://github.com/user-attachments/assets/cf05c11c-3f76-434d-a77a-dc54ad48de60)

2. Trigger the Destroy Environment Workflow:
- To destroy the environment, manually trigger the destroy-environment.yml workflow from GitHub Actions.
- Verify destruction by checking the AWS console to confirm the resources are destroyed.

![image](https://github.com/user-attachments/assets/23aaff4f-d867-4291-85e0-ae91ad0fb186)

------------

