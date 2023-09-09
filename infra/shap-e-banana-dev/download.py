from shap_e.models.download import load_model
import torch

# Runs during container build time to get model weights built into the container
def download_model():
    device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
    load_model('transmitter', device=device)
    load_model('text300M', device=device)


if __name__ == "__main__":
    download_model()
