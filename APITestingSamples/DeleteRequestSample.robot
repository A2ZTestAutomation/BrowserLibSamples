*** Settings ***
Library    RequestsLibrary    

Library    Collections     
  

*** Variables ***
${base_url}    https://reqres.in/api/users
${url}    https://gorest.co.in/public/v2


*** Test Cases ***
Delete_Request
    Create session     myDelSess     ${base_url}
    &{header}=  Create Dictionary  
       Set To Dictionary    ${header}        Cache-Control=no-cache
       Set To Dictionary    ${header}        x-api-key=reqres-free-v1
    ${response}    Delete On Session   myDelSess     /6    headers=${header}
   
Delete a Request with Header
     Create session     myDelSess     ${url}
    &{header}=  Create Dictionary  Authorization=Bearer b8c87e237c1c43cd079cbecef302025986abb7a48864a0b66d31b7742cda36ea
    ${response}    Delete On Session   myDelSess     /users/7901160       headers=&{header} 
    