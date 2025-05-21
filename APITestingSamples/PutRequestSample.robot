*** Settings ***
Library    RequestsLibrary    
Library    Collections
Library    JSONLibrary          

*** Variables ***
${base_url}    https://reqres.in/api/users

*** Test Cases ***
Put_Request
         Create session     myPutSess     ${base_url}    
       &{body}=  Create Dictionary  first_name=Janet    last_name=Thomas     email=janet.weaver@reqres.in
       Log To Console    ${body}    
       &{header}=  Create Dictionary  
       Set To Dictionary    ${header}        Cache-Control=no-cache
       Set To Dictionary    ${header}        x-api-key=reqres-free-v1
       ${response}=     Put On Session  myPutSess     /7   data=${body}     headers=${header}   
       Log To Console    ${response.status_code}   
       Log To Console    ${response.content}     

        ${reqBody}=  Convert To String   ${response.content}
        Should Contain    ${reqBody}  Thomas
            

        # #Check the value of the header Content-Type
        ${getHeaderValue}=  Get From Dictionary  ${response.headers}  Content-Type
        Should be equal  ${getHeaderValue}  application/json; charset=utf-8  