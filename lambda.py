import json, os, boto3
from datetime import datetime, timezone, timedelta

def lambda_handler(event, context):
    # Get values from Lambda Environments
    launch_template_id = os.environ["launch_template_id"]
    sns_arn = os.environ["sns_arn"]
    asg_name = os.environ["asg_name"]
    # Create boto3 Clients
    ec2 = boto3.client("ec2")
    asg = boto3.client("autoscaling")

# Updating Current Launch Template
def update_current_launch_template_ami(ami):
    response = ec2.create_launch_template_version(
        LaunchTemplateId=launch_template_id,
        SourceVersion="$Latest"
        VersionDescription="Latest-AMI",
        LaunchTemplateData={
            "ImageId": ami            
        }
    )
    print(f"New Launch Template with AMI {ami}")

# Set Template as Default
def set_launch_template_default_version():
    response = ec2.modify_launch_template(
            LaunchTemplateId=launch_template_id,
            DefaultVersion="$Latest"
    )
    print("Default launch template set to $Latest.")
    previous_version = str(
        int(response["LaunchTemplate"]["LatestVersionNumber"]) - 2)
    response = ec2.delete_launch_template_versions(
        LaunchTemplateId=launch_template_id,
        Versions=[
            previous_version,
        ]
    )
    print(f"Old launch template {previous_version} deleted.")

# Creating AutoScaling Groups
def create_asg_scheduled_action(start_time,  desired_capacity):
    response = asg.put_scheduled_update_group_action(
        AutoScalingGroupName=asg_name,
        ScheduledActionName=f"Desire {desired_capcity}",
        StartTime=start_time,
        DesiredCapaity=desired_capacity
    )
    print(f"""ASG Action Created
    Start Time: {start_time}"
    Desired Capacity: {desired_capacity}
    """)

# Send NOtification
def sns_notification(subject, message):
    response = sns.publish(
        TargetArn=sns_arn,
        Message=message,
        Subject=subject,
    )
    print(f"""
    Notification Sent.
    Subject: {subject}
    Message: {message}
    """)

# Updating the Template
def update_launch_template_and_asg():
    update_current_launch_template_ami(new_ami)
    set_launch_template_default_version()

    now_utc = datetime.now(timezone.utc)
    in_01_min = now_utc + timedelta(minutes=1)
    in_15_min = now_utc + timedelta(minutes=15)
    create_asg_scheduled_action(in_01_min, 2)    
    create_asg_scheduled_action(in_15_min, 1)

    print("AMI updated!")
ami_status = update_launch_template_and_asg()

print(ami_status)