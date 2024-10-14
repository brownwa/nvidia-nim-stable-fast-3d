# nvidia-nim-stable-fast-3d

This repository is for building an NVIDIA Inference Microservice (NIM) Docker container out of Stability AI's Stable Fast 3D generative AI model

## Building
1. Download the Stable Fast 3D model.safetensors file from Huggingface:

   https://huggingface.co/stabilityai/stable-fast-3d

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