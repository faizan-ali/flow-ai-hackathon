## **Flow.AI: 3D Scene Generation for Emergency Response Planning**

### GenLab Hackathon - DG717 2023-09-09
The Flow.AI platform designed to accelerate the response to natural calamities. In an era defined by the increasing impact of climate change, it empowers individuals and first responders alike to act swiftly and effectively.

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

## Contributors

- **Andrea De Cosmo**
- **KP Kshitij Parashar**
- **Faizan Ali**  
- **Randy Fong**  
- **Silas Everett** 