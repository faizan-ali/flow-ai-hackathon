""" This script is used to send a request to the server to test the API """

import requests, os, sys

# The flask app will automatically save the generated 3D assets in the generated folder if the following variable is set to True
AUTO_SAVE = True


PROMPT = sys.argv[1]

ENDPOINT = 'http://localhost:5005/generate_3d'
NGROK_ENDPOINT = 'https://early-rested-owl.ngrok-free.app/generate_3d'

response = requests.post(NGROK_ENDPOINT, json={"prompt": PROMPT})

PARENT_DIR = os.path.dirname(os.path.abspath(__file__))
ASSETS_DIR = os.path.join(PARENT_DIR, 'generated')
                          

if not AUTO_SAVE:

    if not os.path.exists(ASSETS_DIR):
        print(f"Creating assets dir: ', {ASSETS_DIR}")
        os.makedirs(ASSETS_DIR)

    if os.path.exists(os.path.join(ASSETS_DIR, f"{PROMPT}.obj")):

        print(f"File {PROMPT}.obj already exists")
        sys.exit(0)

    elif not os.path.exists(os.path.join(ASSETS_DIR, f"{PROMPT}.obj")):

        print(f"Creating file {PROMPT}.obj")
        with open(os.path.join(ASSETS_DIR, f"{PROMPT}.obj"), 'wb') as f:
            f.write(response.content)