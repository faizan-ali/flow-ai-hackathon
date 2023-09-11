"""
author @silaseverett@gmail.com
This module integrates the FastAPI framework with the Langchain library to create an API that interacts with GPT-4 language models.
"""


import json
import os
from typing import Literal, Optional
from uuid import uuid4
from fastapi import FastAPI, HTTPException
import random
from fastapi.encoders import jsonable_encoder
from pydantic import BaseModel
from mangum import Mangum
from langchain.llms import OpenAI
from langchain.prompts import PromptTemplate
from dotenv import load_dotenv
load_dotenv('.env')


def complete_prompt_with_context(prompt,template):
        """
    Completes a prompt template with the given context.
    
    Args:
    prompt (str): The prompt to be inserted into the template.
    template (str): The path to the template file.
    
    Returns:
    str: The completed prompt.
    """
  with open(template, 'r') as f:
    prompt_text=f.read() 
  complete_prompt= prompt_text.replace('{context}',prompt)
  return complete_prompt


class Prompt(BaseModel):
    """
    A pydantic model representing a prompt with a message and an optional prompt ID.
    
    Attributes:
    message (str): The message of the prompt.
    prompt_id (str, optional): The unique identifier for the prompt. Defaults to a generated UUID.
    """
    message: str
    prompt_id: Optional[str] = uuid4().hex


app = FastAPI()
handler = Mangum(app)


@app.get("/")
async def root():
    """
    Root endpoint returning a welcome message.
    
    Returns:
    dict: A dictionary containing a welcome message.
    """
    return {"message": "Welcome to Flow.AI's prompt to object parser API"}

@app.post("/get-objects")
async def parse_message(prompt: Prompt):
    """
    Endpoint to parse a message and interact with the GPT-4 language model to get a response.
    
    Args:
    prompt (Prompt): The prompt object containing the message and an optional prompt ID.
    
    Returns:
    dict: A dictionary containing the response from the language model.
    """
    prompt.prompt_id = uuid4().hex
    try:
        llm = OpenAI(openai_api_key=os.getenv('OPENAI_API_KEY'), max_tokens = 2056)
    except:
        print('unable to authenticate with openai')
    prompt2=llm.predict(complete_prompt_with_context(prompt.message,'prompt_template_1.txt'))
    response=llm.predict(complete_prompt_with_context(prompt2,'prompt_template_2.txt'))

    return {"response":response}
