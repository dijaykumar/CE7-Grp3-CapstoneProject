#!/bin/bash
# Update system and install Apache
yum update -y
yum install -y httpd

# Create a simple HTML file
echo "<html><body><h1>Hello, World!</h1></body></html>" > /var/www/html/index.html

# Start Apache
service httpd start
chkconfig httpd on

# Install the CloudWatch Agent
sudo yum install -y amazon-cloudwatch-agent

# Create the CloudWatch Agent config file
sudo echo '{
  "metrics": {
    "metrics_collected": {
      "mem": {
        "measurement": [
          "mem_used",
          "mem_free",
          "mem_cached",
          "mem_total"
        ],
        "metrics_collection_interval": 60
      },
      "disk": {
        "measurement": [
          "disk_used",
          "disk_free",
          "disk_total"
        ],
        "metrics_collection_interval": 60
      }
    }
  }
}' > /opt/aws/amazon-cloudwatch-agent/bin/config.json

# Start the CloudWatch Agent
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a start
