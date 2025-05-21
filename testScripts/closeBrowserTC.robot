*** Settings ***
Library     Browser    auto_closing_level= KEEP


*** Test Cases ***
To Close Browser
    New Browser    chromium    headless=false
    # A context corresponds to a set of independent incognito pages in a browser
    # that share cookies, sessions or profile settings
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page    https://the-internet.herokuapp.com/login
    Set Browser Timeout    timeout=10s
    Type Text    \#username    tomsmith
    Type Text    \#password    SuperSecretPassword!
    Click    button.radius
    # Close Page
    # Close Context

    Set Browser Timeout    timeout=10s
    # New Context    viewport={'width': 1020, 'height': 780}
    New Page    https://robotframework-browser.org/
    Set Browser Timeout    timeout=10s
    # Close Page

    Open Browser    https://the-internet.herokuapp.com/checkboxes
    Set Browser Timeout    timeout=10s

   # Close Browser    

Launch a New Browser
    Open Browser    https://the-internet.herokuapp.com/checkboxes    chromium
    Set Browser Timeout    timeout=10s
