from flask import Flask, request, jsonify
import torch
import yaml
from safetensors.torch import load_file

# Initialize the Flask app
app = Flask(__name__)

# Load configurations from config.yaml
with open('config.yaml', 'r') as file:
    config = yaml.safe_load(file)

# Load the model using the path from the config file
model_path = config['model_path']
model = load_file(model_path)

@app.route('/predict', methods=['POST'])
def predict():
    # Get the data from the request
    data = request.get_json()
    input_tensor = torch.tensor(data['input'])

    # Perform inference
    with torch.no_grad():
        output = model(input_tensor)

    # Convert the output to a list and return as JSON
    output_list = output.tolist()
    return jsonify({'output': output_list})

# Run the Flask app
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)