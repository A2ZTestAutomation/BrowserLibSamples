*** Settings ***
Library    Browser  

*** Variables ***

${BROWSER}            chrome
${DELAY}              0
${VALID USER}         tomsmith
${VALID PASSWORD}     SuperSecretPassword!
${LOGIN URL}          https://the-internet.herokuapp.com/login
${LOGIN BUTTON}       xpath://button[@class='radius']

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Login Page Should Be Open

Login Page Should Be Open
    ${url}  Get Url     *=  login
    Log To Console  ${url}

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Type Text    id:username    ${username}

Input Password
    [Arguments]    ${password}
    Type Text    id:password    ${password}

Submit Credentials
    Click     ${LOGIN_BUTTON}
   