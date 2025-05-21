*** Settings ***
Library    Browser    


*** Test Cases ***
Scroll Test
    Open Browser    https://demoblaze.com/    chromium
    sleep    2s
    ${elementName}   Get Element    "Samsung galaxy s7"
    Scroll To element     ${elementName}

    sleep    2s
    # To scroll into particular element
    Scroll To    vertical=bottom
     sleep    2s
#     # To scroll Top
     Scroll By    vertical=-500  
     sleep    2s  
#     # Close Browser
    
    