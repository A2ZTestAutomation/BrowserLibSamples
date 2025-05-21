*** Settings ***
Library    OperatingSystem
Library    String
Library    Collections
Library    JSONLibrary
   

*** Variables ***

*** Test Cases *** 
 
Reading from Text File
        ${str}     Get file     ${CURDIR}/output.txt
        Should Contain     ${str}     successfully completed


Reading data from csv File
    ${FILE_CONTENT}=   Get File    ${CURDIR}/inputData.csv
    Log    File Content: ${FILE_CONTENT}
    @{LINES}=   Split to Lines and Remove Header   ${FILE_CONTENT}
    Log    ${LINES}
    ${RESULT}=   Calculate Sum From List   ${LINES}
    Log    ${RESULT}

*** Keywords ***
Split to Lines and Remove Header
    [Arguments]    ${FILE_CONTENT}
    @{LINES}=    Split To Lines    ${FILE_CONTENT}
    # Remove the header
    Remove From List    ${LINES}    0
    RETURN    @{LINES}

Calculate Sum From List
    [Arguments]    ${LIST}
    ${RESULT}=    Set Variable    0
    FOR    ${LINE}    IN    @{LIST}
       Log    ${LINE}
        @{COLUMNS}=    Split String    ${LINE}    separator=,
        ${VALUE}=    Get From List    ${COLUMNS}    2
        Log    ${VALUE}
        ${RESULT}=    Evaluate    ${RESULT}+${VALUE}
    END
    RETURN    ${RESULT}


*** Test Cases ***
Create Employee Json File
    # Define the file path
    ${jsonFile}=    Set Variable    ${CURDIR}/employee.json

    # Create JSON data
    ${jsonData}=    Create Dictionary
    Set To Dictionary    ${jsonData}    id=101
    Set To Dictionary    ${jsonData}    name=Alice Britto
    Set To Dictionary    ${jsonData}    department=Engineering
    Set To Dictionary    ${jsonData}    role=Software Developer
    Set To Dictionary    ${jsonData}    salary=75000

    # Write JSON data to the file
    Dump JSON To File     ${jsonFile}     ${jsonData}
    Log    Employee JSON file created at: ${jsonFile}
#To update a value in the JSON file
    ${updatedJsonData}    Update Value To Json    ${jsonData}    salary    90000
   Dump Json To File    ${jsonFile}    ${updatedJsonData}
    Should Have Value In Json    ${updatedJsonData}    department   

    