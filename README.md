# nvidia-nim-stable-fast-3d

This repository is for building an NVIDIA Inference Microservice (NIM) Docker container out of Stability AI's Stable Fast 3D generative AI model

## Quick Start
1. Pull the Docker image from Docker Hub: [waheedbrown/nim-stable-fast-3d](https://hub.docker.com/repository/docker/waheedbrown/nim-stable-fast-3d/general):
   ```
   docker pull waheedbrown/nim-stable-fast-3d:latest
   ```
2. Test locally:
   ```
   docker run --gpus all -p 8000:8000 nim-stable-fast-3d
   ```
   In a seperate terminal, execute a curl request against the locally hosted Docker image:
   ```
   # Linux:
   curl -X POST http://localhost:8000/predict \
     -H "Content-Type: application/json" \
     -d '{"input": [1, 2, 3]}'
   ```
   ```
   # Windows PowerShell:
   Invoke-WebRequest `
    -Uri http://localhost:8000/predict `
    -Method POST `
    -ContentType "application/json" `
    -Body '{"input": [1, 2, 3]}'
   ```
   **NOTE:** I still need to update the above curl and WebRequest commands to match the manual inference parameters in the official [Stable Fast 3D documentation](https://github.com/Stability-AI/stable-fast-3d?tab=readme-ov-file#manual-inference)

## Building
1. Download the Stable Fast 3D model.safetensors file from Huggingface: [stabilityai/stable-fast-3d](https://huggingface.co/stabilityai/stable-fast-3d)

   **NOTE:** The model.safetensors file is over 4 GB in size, which complicates `git push`es to GitHub

2. Build the NVIDIA NIM Docker image:
   ```
    docker build -t nim-stable-fast-3d .
   ```

## Testing
To test your NIM Docker image locally, follow these steps:

Run the Docker Container: Start the container, making sure to expose the necessary ports.

bash
```
docker run --gpus all -p 8000:8000 nim-stable-fast-3d
```

Check Logs: Monitor the container logs to ensure the service starts correctly.

bash
```
docker logs -f <container-id>
```

Send Test Requests: Use curl or a tool like Postman to send test requests to your NIM.

bash
```
curl -X POST http://localhost:8000/predict -H
```
