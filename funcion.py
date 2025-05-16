import json
import boto3

# Initialize AWS SSM client
ssm = boto3.client('ssm')

def lambda_handler(event, context):
    parameter_name = "/app/config/api_key"
    
    # Fetch the Parameter Store value
    response = ssm.get_parameter(Name=parameter_name, WithDecryption=True)
    api_key = response["Parameter"]["Value"]

    return {
        "statusCode": 200,
        "body": json.dumps({"message": f"Fetched API Key: {api_key}"})
    }
