*** Settings ***
Library    Browser 

*** Variables ***

*** Test Cases ***
Sample Test Case
    
     ${sum}=    Add    4    6
    
     Should Be Equal As Integers    10    ${sum}    
     
     ${changedName}     Change Nickname    TestUser    RobotTestUser   
     

*** Keywords ***  

Add
    [Arguments]    ${value1}     ${value2}
    ${sum}=    Evaluate    ${value1} + ${value2}      
    RETURN    ${sum}
 
Change Nickname
    [Arguments]    ${oldname}    ${newname}
    Log To Console    ${newname}
    RETURN    ${newname}
    
Print Log
    [Arguments]    ${anyText}
    Log To Console    The text is :    ${anyText}    


  

    
