*** Settings ***
Library    Browser
# Library    AppiumLibrary

*** Test Cases ***
For Loop Test
              
        @{employeeList}     Create List  11    222    33    444    555
        Log to console    List of Employees are
        FOR      ${i}  IN    @{employeeList}
                Log To Console   ${i}
                Exit For Loop If    ${i}==33
        END
        IF    1 == 0
            Log To Console    message
        END
        Close Browser
      
For Loop In Range Test
    Open Browser   https://www.demoblaze.com/#    chromium   
    Sleep    15s    
    @{elements_list}    Get Elements    h4.card-title a
    ${itemcount}    Get Element Count    h4.card-title a
    Log To Console   ${itemcount}
    Log To Console   "Elements are:",@{elements_list}    
    FOR    ${element}    IN    @{elements_list}
        ${elementText}     Get Text    ${element}
        Log     ${elementText}
        # Run Keyword If    '${elementText}' == 'Samsung galaxy s7'    Click   ${element}
         IF    '${elementText}' == 'Samsung galaxy s7'
             Click   ${element}
            BREAK
         END        
#     
    END    
    Close Browser
  
