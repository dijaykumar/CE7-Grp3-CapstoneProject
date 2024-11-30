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
