*** Settings ***
Library     Browser


*** Variables ***
${URL}          https://testautomationpractice.blogspot.com/
${BROWSER}      chromium


*** Test Cases ***
Handling normal alert
    Open Browser    ${URL}    ${BROWSER}
    # Click    \#alertBtn
    # # Set Browser Timeout    timeout=10s
    #  Wait For Alert     action=accept    text=I am an alert box!!  
       
    ${promise} =       Promise To    Wait For Alert    action=accept    text= I am an alert box!
    Click             \#alertBtn
    ${text} =          Wait For      ${promise}

Handling confirm alert
    Open Browser    ${URL}    ${BROWSER}
    ${promise} =       Promise To    Wait For Alert    action=dismiss    text= Press a button!
    Click             \#confirmBtn
    ${text} =          Wait For      ${promise}

Handling prompt alert
    Open Browser    ${URL}    ${BROWSER}
    ${promise} =       Promise To    Wait For Alert    action=accept    prompt_input=Hello Welcome
    Click             \#promptBtn
    ${text} =          Wait For      ${promise}
 

