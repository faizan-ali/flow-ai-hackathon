# Prompt API overview

Prompt API takes a written description of a crises situation within a JSON array and returns all key entities with their spacial location and relative sizes.  

Here's a basic descrition of the API set up.  For details on FastAPI go to FastAPI on github.

## Requirements
- AWS account  
 - openai API key


## main.py

Replace the OPENAI_API_KEY with your key.

## Deploying to AWS Lambda

Set up an AWS Lambda function using Python 9 or above. 

Note that FastAPI uses:

```python
from mangum import Mangum

app = FastAPI()
handler = Mangum(app)
```

Modify AWS Lambda's event handler to `main.handler` in the Lambda's runtime settings. main.py will be the name of script.

Install dependencies into a local directory so we can zip it up and upload it to Lambda.

```bash
pip install -t lib -r requirements.txt
```

We now need to zip it up.

```bash
(cd lib; zip ../lambda_function.zip -r .)
```

Now add our FastAPI file and the JSON file.

```bash
zip lambda_function.zip -u main.py prompt_template_1.txt prompt_template_2.txt .env
```

In the Lambda console upload the .zip file.
In the `configuration` tab, select `function url`. Select `NONE` for IAM permissions.
In the advanced settings below, select `CORS` and save the changes. 

**Now we are ready to go!** 

Click the `Function url` provided. 

See FastAPI documentation by adding /docs to the url, for example:
https://looz2lqanh2e35fgmjrbvo4yde0dywuu.lambda-url.us-west-2.on.aws/docs

You should see:

![alt text](https://github.com/faizan-ali/flow-ai-hackathon/blob/main/assets/prompt_api.png)

From your terminal use Curl for /get-objects:

```
curl -X 'POST' \
>   'https://looz2lqanh2e35fgmjrbvo4yde0dywuu.lambda-url.us-west-2.on.aws/get-objects' \
>   -H 'accept: application/json' \
>   -H 'Content-Type: application/json' \
>   -d '{
>   "message": "huge earthquake in marrakesh with a building that crumbles on to people",
>   "prompt_id": "32be7316a3ac45b3bebaaa79e3aa77bf"
> }'
```


An example output looks like the following:
```
{"response":"\n{\n  \"assets\": [\n    {\n      \"title\": \"building\",\n      \"position\": \"{“x”: 0, “y”: -5, “z”: 0}\",\n      \"scale\":  \"{“length”: 100, “width”: 50, “height”: 100}\",\n      \"color\": \"grey\"\n    },\n    {\n      \"title\": \"rubble\",\n      \"position\": \"{“x”: 5, “y”: -3, “z”: 0}\",\n      \"scale\":  \"{“length”: 10, “width”: 10, “height”: 10}\",\n      \"color\": \"grey\"\n    },\n    {\n      \"title\": \"people\",\n      \"position\": \"{“x”: 10, “y”: -1, “z”: 0}\",\n      \"scale\":  \"{“length”: 0, “width”: 0, “height”: 0}\",\n      \"color\": \"none\"\n    },\n    {\n      \"title\": \"mosque\",\n      \"position\": \"{“x”: -5, “y”: -3, “z”: 0}\",\n      \"scale\":  \"{“length”: 50, “width”: 25, “height”: 50}\",\n      \"color\": \"none\"\n    }\n  ]\n}"
}
```

