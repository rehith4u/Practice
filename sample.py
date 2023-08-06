import boto, os, json
from datetime import datetime, timezone, timedelta


def lambda_handler (event, context):
    launch_template_id = os.environ("launch_template_id")
    asg_name = os.environ("asg_name")
    
    ec2 = boto3.client("ec2")
    asg = boto3.client("autoscaling")


# Update Current Launch Template
def update_current_launch_template_ami(ami):
    response = ec2.create_launch_template_version(
        LaunchTemplateId=launch_template_id, SourceVersion="$Latest", Version="Latest-AMI",
        LaunchTemplateData={"ImageId": ami}
    )
    print(f"New Launch Template with AMI {ami}")






# Create Autoscalng Groups

# Send Notification

# Updation

