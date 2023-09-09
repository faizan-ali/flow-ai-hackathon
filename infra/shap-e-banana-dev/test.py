import boto3
import os
from dotenv import load_dotenv

load_dotenv()

filename = 'test3.txt'

s3 = boto3.client('s3', aws_access_key_id=os.environ['AWS_ACCESS_KEY_ID'],
                  aws_secret_access_key=os.environ['AWS_SECRET_ACCESS_KEY'])
s3.upload_file(filename, 'flow-ai-hackathon', filename)

print('Uploaded to S3')
