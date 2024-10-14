# Use NVIDIA's base image with CUDA support
FROM nvidia/cuda:11.0.3-base-ubuntu20.04

# Set the maintainer
LABEL maintainer="waheedbrown@gmail.com"

# Install Python and other dependencies
RUN apt-get update && apt-get install -y \
    python3-pip \
    python3-venv

# Create a virtual environment
RUN python3 -m venv /venv

# Activate the virtual environment
ENV PATH="/venv/bin:$PATH"

# Install necessary Python packages
COPY requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# Copy model files into the container
COPY config.yaml /app/config.yaml
COPY model.safetensors /app/model.safetensors
COPY app.py /app/app.py
COPY sf3d.gif /app/sf3d.gif

# Set the working directory
WORKDIR /app

# Expose the port
EXPOSE 8000

# Run the application
CMD ["python", "app.py"]