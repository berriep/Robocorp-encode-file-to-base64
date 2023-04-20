# Robocorp-encode-file-to-base64
With this Robocorp robot you can encode a file(s) to base64.
It is just an example, you can change the code to your needs.

## What does it do
You can use this robot to encode one single file or multiple files.

It has 2 keywords you can use for this:
 - `Encode Files to Base64`
 - `Encode Single File to Base64`


## Supported file formats
 - .pdf 
 - .doc .docx 
 - .xls .xlsx 
 - .json
 
## Max file size
`${file_size}` checks up front if the file size is below the threshold. You can adjust this by changing variable `${maxfilesize}`, which holds the max size in bytes.

## Input
Put your file(s) in the input folder

## Output
A variable called `${base64_encoded}` holds the base64 value which you can use.

The same value is written in file (`${file_name}.base64.txt`) in the output folder. This is only for debugging.
I would recommend to remove this part of the code in production.

## Possible adjustments
- `${file_ext}` can be used to check up front if the file ext is suported




