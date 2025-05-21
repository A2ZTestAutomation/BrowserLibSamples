*** Settings ***
Library     Browser


*** Variables ***
${BROWSER}              chromium

${VALID USER}           tomsmith
${VALID PASSWORD}       SuperSecretPassword!
${LOGIN URL}            https://the-internet.herokuapp.com/login
${LOGIN BUTTON}         button.radius
${errMsg}               invalid!
${successMsg}           You logged into a secure area!


*** Keywords ***
Open Browser To Login Page
       Open Browser    ${LOGIN URL}    ${BROWSER}

    
Go To Login Page
    Go To    ${LOGIN URL}
  

Input Username
    [Arguments]    ${username}
    Type Text    \#username    ${username}

Input Password
    [Arguments]    ${password}
    Type Text    \#password    ${password}

Submit Credentials
    Click    ${LOGIN_BUTTON}

Login Should Have Failed
    [Arguments]    ${errMsg}
    Get Text    \#flash    *=    ${errMsg}
    # Should Contain    id:flash    ${errMsg}

Login should have passed
    [Arguments]    ${successMsg}
    Get Text    \#flash    *=    ${successMsg}
