*** Settings ***
Library   Browser


*** Variables ***
# ${browser}      chrome
${browser}      chromium
${username}     tomsmith
${password}     SuperSecretPassword!
${invalid_username}     tomsmith123
${invalid_password}     SuperSecretPassword123


*** Test Cases ***
Valid Login Test
    New Browser    ${browser}    headless=false
    New Context    viewport={'width': 1620, 'height': 1080}
    New Page    https://the-internet.herokuapp.com/login
    type text  \#username     ${username}
    type text  \#password     ${password}
    Click      \#login >> .radius
    # click    button.radius    
    ${pageTitle}    get title     ==     The Internet
    Log To Console  ${pageTitle}
  
    ${url}  Get Url     *=  secure
    Log To Console  ${url}

Invalid Login Test
    New Browser    ${browser}    headless=false
    New Context    viewport={'width': 1620, 'height': 1080}
    New Page    https://the-internet.herokuapp.com/login
    type text  \#username    ${invalid_username} 
    type text  \#password     ${invalid_password}
    Click      \#login >> .radius
    # click    button.radius    
    ${url}  Get Url     *=  secure
    Log To Console  ${url}


   
     