*** Settings ***
Library    Browser

*** Variables ***

*** Test Cases ***
Sample Debug Test
    # Open Browser    https://www.google.com/    chromium
    ${result}    Evaluate      1+1
    ${result}    Evaluate      5+4
    ${result}    Evaluate      3+2
    ${result}    Evaluate      2+1
    ${result}    Evaluate      16+11
    ${result}    Evaluate      1+25
    Log To Console   ${result}

    FOR    ${counter}    IN RANGE    1    5    1
        Log    ${counter}
        
    END