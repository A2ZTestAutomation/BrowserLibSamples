*** Settings ***
Library    RequestsLibrary    
Library    Collections     
Library    JSONLibrary     

*** Variables ***
${base_url}    https://jsonplaceholder.typicode.com  
${url}          https://gorest.co.in/public-api

*** Test Cases ***
Post_Reequest
       Create session     myPostSess     ${base_url}    verify=true
       &{body}=  Create Dictionary  title=foo  body=bar  userId=9000
       Log     ${body}    
       &{header}=  Create Dictionary  Cache-Control=no-cache
       ${response}=     Post On Session  myPostSess     /posts    
       ...    data=${body}   headers=${header}   
       Log     ${response.status_code}   
       Log    ${response.content}     
              
        ${status_code}=     convert to string     ${response.status_code}
         Should Be Equal    ${status_code}    201
        
        # #Check id as 101 from Response Body
        ${id}=  Get Value From Json  ${response.json()}  id
        ${idFromList}=  Get From List   ${id}  0
        ${idFromListAsString}=  Convert To String  ${idFromList}
        Should be equal As Strings  ${idFromListAsString}  101

        # #Check the value of the header Content-Type
        ${getHeaderValue}=  Get From Dictionary  ${response.headers}  Content-Type
        Should be equal  ${getHeaderValue}  application/json; charset=utf-8  

 Post_RequestWithBearerToken
       Create session     myPostSess    ${url}    verify=true
       &{body}=  Create Dictionary  
       ...  name=TestAutomation123    
       ...    gender=female    
       ...    email=x1y1z1@gmail.com    
       ...    status=Active
       Log     ${body}    
       # &{header}=  Create Dictionary  authorization=Bearer 31dff4a9cda45665e4b03f99504de42f1cb6ddc456bb25f312880e227b28d091
         &{header}=  Create Dictionary  authorization=Bearer b8c87e237c1c43cd079cbecef302025986abb7a48864a0b66d31b7742cda36ea
       ${response}=     Post On Session  myPostSess     /users      
       ...    data=${body}     headers=${header}   
       Log     ${response.status_code}   
       Log     ${response.content}     
        
       ${getHeaderValue}=  Get From Dictionary  ${response.headers}  Content-Type
       Should be equal  ${getHeaderValue}  application/json; charset=utf-8  
