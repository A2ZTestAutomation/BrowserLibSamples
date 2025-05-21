*** Settings ***
Library     Browser     

*** Variables ***

*** Test Cases ***
Handle Tabbed Window
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page    https://the-internet.herokuapp.com/windows
    @{parentPageID}    Get Page Ids    ACTIVE
    Click   text=/^Click Here/

    ${childWinHandle} =    Switch Page      NEW
    Sleep    5s  
    Get Title   ==   New Window    
     Close Page
    @{pageIds}    Get Page Ids    CURRENT
    # Switch Page   ${parentPageID}[0]
     Get Title   ==   The Internet 
    Log    ${pageIds}
   
    Sleep    5s   
    Close Page
      

        
# Handle Browser Window
#     Open Browser    https://www.stqatools.com/demo/Windows.php    chrome
#     Click Button    xpath=//button[contains(text(), 'new Window')]
#     ${windowIDs}      Get Browser Ids
#     Log    ${windowIDs}
#     Switch Browser    2
#     Sleep     5s
#     Click Button     xpath=//button[contains(text(), 'Message Window')]
#     Sleep     5s
#     Close All Browsers
    
    
    
    