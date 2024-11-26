#!/bin/bash
# Update system and install Apache
yum update -y
yum install -y httpd

# Create a simple HTML file
echo "<html><body><h1>Hello, World!</h1></body></html>" > /var/www/html/index.html

# Start Apache
service httpd start
chkconfig httpd on
