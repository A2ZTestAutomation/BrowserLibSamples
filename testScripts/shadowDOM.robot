*** Comments ***
# write testcase to test shadow DOM for this url https://the-internet.herokuapp.com/shadowdom


*** Settings ***
Library     Browser


*** Test Cases ***
Shadow DOM Test
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page    http://uitestingplayground.com/shadowdom

    # ${DOMElem}    Get Element    guid-generator > input#editField
      ${DOMElem}    Get Element     input#editField
    Type Text       ${DOMElem}    Welcome
    Click       guid-generator > button#buttonGenerate
    
    ${DomText}    Get Text    guid-generator > input#editField
    Log To Console    message=${DomText}
 
#
