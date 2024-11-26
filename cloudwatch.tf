# CloudWatch Dashboard to monitor EC2 metrics
resource "aws_cloudwatch_dashboard" "ec2_dashboard" {
  dashboard_name = "CE7-Grp3-CloudWatchDashboard"

  dashboard_body = jsonencode({
    "widgets" = [
      {
        "type" = "metric",
        "x" = 0,
        "y" = 0,
        "width" = 12,
        "height" = 6,
        "properties" = {
          "metrics" = [
            ["AWS/EC2", "CPUUtilization", "InstanceId", aws_instance.ce7_grp3_ec2.id]
          ],
          "view" = "timeSeries",
          "stacked" = false,
          "region" = "us-east-1",
          "title" = "EC2 CPU Utilization"
        }
      },
      {
        "type" = "metric",
        "x" = 0,
        "y" = 6,
        "width" = 12,
        "height" = 6,
        "properties" = {
          "metrics" = [
            ["AWS/EC2", "NetworkIn", "InstanceId", aws_instance.ce7_grp3_ec2.id],
            ["AWS/EC2", "NetworkOut", "InstanceId", aws_instance.ce7_grp3_ec2.id]
          ],
          "view" = "timeSeries",
          "stacked" = false,
          "region" = "us-east-1",
          "title" = "EC2 Network Traffic"
        }
      },
      {
        "type" = "metric",
        "x" = 0,
        "y" = 12,
        "width" = 12,
        "height" = 6,
        "properties" = {
          "metrics" = [
            ["AWS/EC2", "DiskReadOps", "InstanceId", aws_instance.ce7_grp3_ec2.id],
            ["AWS/EC2", "DiskWriteOps", "InstanceId", aws_instance.ce7_grp3_ec2.id]
          ],
          "view" = "timeSeries",
          "stacked" = false,
          "region" = "us-east-1",
          "title" = "EC2 Disk Operations"
        }
      }
    ]
  })
}
