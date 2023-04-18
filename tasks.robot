*** Settings ***
Library     encode_multi_filetypes_base64
Library     RPA.FileSystem
Library     RPA.PDF


*** Variables ***
${maxfilesize}      67108864 #64mb
${inputfolder}      %{ROBOT_ROOT}/Input
${outputfolder}     %{ROBOT_ROOT}/Output

*** Tasks ***
Encode Files to Base64
    [Documentation]    file_ext can be used to check up front if the file ext is suported. (.pdf,.doc,.docx,.xls,.xlsx,.json)
    ...    file_size can be used to check up front if the file size is supported.
    ...    variable maxfilesize holds the max size in bytes.
    Log Directory Tree    ${inputfolder}
    ${files}=    List Files In Directory    ${inputfolder}
    FOR    ${file_path}    IN    @{files}
        Log    ${file_path}
        ${file_ext}=     Get File Extension    ${file_path}
        ${file_size}=    Get File Size    ${file_path}
        ${file_name}=    Get File Name    ${file_path}
        IF    $file_size < ${maxfilesize}
            ${base64_encoded}=    encode_file_to_base64    ${file_path}
            Create File    ${outputfolder}/${file_name}.base64.txt    ${base64_encoded}    overwrite=${TRUE}
        ELSE
            Log    File is to big: ${file_size}. Max size is ${maxfilesize}.    console=${TRUE}
        END
    END

Encode Single File to Base64
    ${file_path}=    Set Variable    ${inputfolder}/example.json
    ${file_ext}=     Get File Extension    ${file_path}
    ${file_size}=    Get File Size    ${file_path}
    ${file_name}=    Get File Name    ${file_path}
    IF    $file_size < ${maxfilesize}
        ${base64_encoded}=    encode_file_to_base64    ${file_path}
        Create File    ${outputfolder}/${file_name}.base64.txt    ${base64_encoded}    overwrite=${TRUE}
    ELSE
        Log    File is to big: ${file_size}. Max size is ${maxfilesize}.    console=${TRUE}
    END
