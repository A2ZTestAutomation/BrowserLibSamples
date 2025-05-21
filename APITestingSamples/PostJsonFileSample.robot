*** Settings ***
Library    RequestsLibrary    
Library    Collections     
Library    JSONLibrary     
Library    OperatingSystem    

*** Variables ***
${base_url}    https://jsonplaceholder.typicode.com  

*** Test Cases ***
Post_Request
       Create session     myPostSess     ${base_url}    verify=true
       # &{body}=  Create Dictionary  title=foo  body=bar  userId=9000
       &{jsonContent}=    Load JSON From File    ${CURDIR}\\postData.json
       Log To Console    ${jsonContent}    
       &{header}=  Create Dictionary  Cache-Control=no-cache    Content-Type=application/json
       ${response}=     Post On Session  myPostSess     /posts      json=${jsonContent}     headers=${header}   
       Log To Console    ${response.status_code}   
       Log To Console    ${response.content}     
              
        ${status_code}=     convert to string     ${response.status_code}
         Should Be Equal    ${status_code}    201
         
# #Check id as 101 from Response Body
        ${id}=  Get Value From Json  ${response.json()}  id
        ${idFromList}=  Get From List   ${id}  0
        ${idFromListAsString}=  Convert To String  ${idFromList}
        Should be equal As Strings  ${idFromListAsString}  101
        