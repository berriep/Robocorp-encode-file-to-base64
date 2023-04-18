import base64
import os
import sys
import zipfile

def encode_file_to_base64(file_path):
    file_extension = os.path.splitext(file_path)[1].lower()

    if file_extension == '.pdf':
        with open(file_path, 'rb') as f:
            encoded_data = base64.b64encode(f.read())
            base64_encoded = encoded_data.decode('utf-8')
            return base64_encoded

    elif file_extension in ('.doc', '.docx'):
        with open(file_path, 'rb') as f:
            if file_extension == '.docx':
                zipped_data = f.read()
                zip_file = zipfile.ZipFile(file_path)
                document = zip_file.read('word/document.xml')
            else:
                document = f.read()
            encoded_data = base64.b64encode(document)
            base64_encoded = encoded_data.decode('utf-8')
            return base64_encoded

    elif file_extension in ('.xls', '.xlsx'):
        with open(file_path, 'rb') as f:
            encoded_data = base64.b64encode(f.read())
            base64_encoded = encoded_data.decode('utf-8')
            return base64_encoded
        
    elif file_extension == '.json':
        with open(file_path, 'r') as f:
            encoded_data = base64.b64encode(f.read().encode('utf-8'))
            base64_encoded = encoded_data.decode('utf-8')
            return base64_encoded

    else:
        raise ValueError('Unsupported file format')

if __name__ == '__main__':
    file_path = sys.argv[1]
    base64_encoded = encode_file_to_base64(file_path)
    print(base64_encoded)
