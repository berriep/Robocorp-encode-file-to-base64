import json
import base64

def encode_json_file_to_base64(file_path):
    with open(file_path, 'r') as f:
        json_data = json.load(f)
        json_string = json.dumps(json_data)
        encoded_bytes = base64.b64encode(json_string.encode('utf-8'))
        base64_encoded = encoded_bytes.decode('utf-8')
        return base64_encoded