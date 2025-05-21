*** Settings ***
Library    RequestsLibrary    
Library    Collections      
*** Variables ***
${base_url}    https://demoqa.com/utilities/weather/city
${city}        chennai

*** Test Cases ***
Get_weatherInfo
    Create session     myGetSess     ${base_url}
      ${response}   Get On Session    myGetSess     /${city}
                  
        Status Should Be    200    ${response} 
        Should Be Equal As Strings    ${response.reason}    OK
        ${reqBody}=  Convert To String   ${response.content}
        Log     ${reqBody}
        Should Contain    ${reqBody}  chennai
          
# Validate Content header
        Log To Console    ${response.headers}[Content-Type]
        Dictionary Should Contain Key    ${response.headers}    Content-Type     
            
        
                     
