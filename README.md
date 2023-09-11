![alt text](https://github.com/faizan-ali/flow-ai-hackathon/blob/main/assets/flowai.png)


## **Flow.AI: 3D Scene Generation for Emergency Response Planning**

### GenLab Hackathon - DG717 2023-09-09
The Flow.AI platform designed to accelerate the response to natural calamities. In an era defined by the increasing impact of climate change, it empowers individuals and first responders alike to act swiftly and effectively. Presentation found [here](https://docs.google.com/presentation/d/1wIM2Ygbg6eew-7CUEaJkAURrpnOmEWVk4LKU4b87EjI/edit?usp=sharing). 

#### **Description**
Leverage the innovative AI technology of GPT-4 to translate textual descriptions into realistic 3D scenes grounded in real-world geographic and structural data. Our solution facilitates non-verbal communication through interactive 3D scenes. By integrating Text-to-3D visualizations using GPT-4 and shape-diffusion models, we empower situational awareness for dynamic response planning.

This project enhances situational awareness for emergency responders, facilitating dynamic response planning through real-time interactive scenarios. The solution integrates with GIS and other databases, guaranteeing detailed and accurate 3D visualizations.

#### **Directory Outline**
- **app/**
  - This directory houses the Flask app, which contains samples of 3D assets and gifs showcasing the potential visualizations created by the AI.
- **infra/shap-e-banana-dev/**
  - Find the deployment setup files for banana.dev in this directory, facilitating a seamless setup experience.
- **prompt/**
  - This directory contains the API responsible for generating entities and spatial relationships from the text, a crucial component in the 3D scene generation process.

#### **Instructions for Use**
1. **Setup**
   - Ensure you have Python and Flask installed in your environment.
   - Clone the repository to your local system.
   
2. **Deployment**
   - Navigate to the `infra/shap-e-banana-dev` directory.
   - Follow the deployment instructions available in the directory to set up on banana.dev.

3. **Using the Flask App**
   - Head to the `app/` directory.
   - Run the Flask app following the instructions available within the directory to view samples of 3D assets and gifs.
   
4. **Working with the API**
   - Go to the `prompt/` directory.
   - Follow the instructions to work with the API for generating entities and spatial relationships from text inputs.

5. **Feedback and Contributions**
   - We appreciate feedback and contributions. Feel free to open issues or pull requests to help improve the project.

---

Make sure to include any necessary prerequisites in the setup instructions and detail the steps to use each component of the repository effectively in the Instructions for Use section. Adjust the titles and descriptions to better fit your project's specifics.

### Running the frontend
`cd frontend` then follow the instructions in the README.md in that folder

```shell
cd frontend
```

Copy `.env.example` to `.env`
```shell
cp .env.example .env
```

Fill in details. Reach out to Faizan for these.

Install dependencies.
```bash
npm install
```

Run the dev server.
```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser.


You can start editing the page by modifying `app/page.tsx` and its subcomponents e.g. `Landing.tsx` The page auto-updates as you edit the file.


### Running the Backend

To run the backend, follow these steps:

1. Navigate to the app directory:
   ```shell
   cd app
   ```

2. The backend is implemented as a Flask application and has the following features:

    - **3D Model Generation**: The backend can generate 3D models.
    - **Endpoint for 3D Models**: You can access the 3D models via the `generate_3d` endpoint.
    - **GPU Usage for Shap-e**: To ensure efficient processing, the backend requires GPU (Graphics Processing Unit) support.
    - **Default 3D Model Format**: By default, the generated 3D models are in the GLB (GL Binary) format, suitable for web applications.
    - **Alternative Output Formats**: The backend offers options to generate 3D models in other formats, such as OBJ or GIF files

## Contributors

- **Andrea De Cosmo**
- **KP Kshitij Parashar**
- **Faizan Ali**  
- **Randy Fong**  
- **Silas Everett** 