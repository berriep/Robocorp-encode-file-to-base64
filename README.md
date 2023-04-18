# Robocorp-encode-file-to-base64
With this Robocorp robot you can encode a file(s) to base64.
It is just an example, you can change the code to your needs.

## How does it work
You can use this robot to encode one single file or multiple files.

It has 2 keywords you can use for this:
 - Encode Files to Base64
 - Encode Single File to Base64

Supported formats are: 
 - .pdf 
 - .doc .docx 
 - .xls .xlsx 
 - .json

## Input
Put your file(s) in the input folder

## Output
A variable called ${base64_encoded} holds the base64 value which you can use.

The same value is written in a ${file_name}.base64.txt file in the output folder. This is only for debugging.
I would recommend to remove this part of the code in production.




