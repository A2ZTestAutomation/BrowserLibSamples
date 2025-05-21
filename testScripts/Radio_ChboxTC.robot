*** Settings ***
Library             Browser 
Test Setup      open browser    ${URL}    ${BROWSER}
Test Teardown      Close Browser   

*** Variables ***
${URL}        https://testautomationpractice.blogspot.com/
${BROWSER}    chromium

*** Test Cases ***
Handle RadioButtons
    #    open browser    ${URL}    ${BROWSER}
       Check Checkbox    \#male
       # Check Checkbox    female
       ${gender} =   Get Text    \#male
       Run Keyword If    '${gender}' == 'male'    
       ...    Log    Selected Gender is Male ....${gender}

       #To unselect checkboc
       # Uncheck Checkbox    \#male
       #To make it fail
       Get Checkbox State    \#male     ==     True
        # Get Checkbox State    \#male     ==     False
Handle Checkboxes
    # open browser    ${URL}    ${BROWSER}
    Scroll To Element    \#sunday
    Check Checkbox    \#sunday
    Check Checkbox    \#monday
    Check Checkbox    \#tuesday

    Get Checkbox State    \#sunday     ==     True
    Uncheck Checkbox  \#sunday
    Sleep     5s   




