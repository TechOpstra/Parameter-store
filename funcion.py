import json
import boto3
import os

ssm = boto3.client('ssm')
sns = boto3.client('sns')

def lambda_handler(event, context):
    parameter_name = "/app/config/api_key"
    response = ssm.get_parameter(Name=parameter_name, WithDecryption=True)
    api_key = response["Parameter"]["Value"]

    message = f"Updated API Key from Parameter Store: {api_key}"

    sns.publish(
        TopicArn=os.environ["SNS_TOPIC_ARN"],
        Message=message,
        Subject="Parameter Store Update Notification"
    )

    return {
        "statusCode": 200,
        "body": json.dumps({"message": "Notification Sent!"})
    }
