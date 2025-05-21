*** Settings ***
Library    Browser

*** Variables ***
${URL}        https://testautomationpractice.blogspot.com/
${BROWSER}    chromium


*** Test Cases ***
Browser Navigation Test
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page    http://uitestingplayground.com/textinput?

    Take Screenshot   \#updatingButton   fullPage=False      fileType=jpeg    quality=50    timeout=10s
    Take Screenshot   EMBED

    type Text    id=newButtonName    Welcome
    Click     id=updatingButton
    
    Take Screenshot   fullPage=True    fileType=jpeg    quality=50    timeout=10s
    Take Screenshot   EMBED
    
    ${pageLocation}     Get Url
    Log     ${pageLocation}
           
     Go Back
    # Sleep     5s
    
     Go to    ${pageLocation}
    # Sleep    5s
    
    
    # Close Browser

Screenshot Sample
     open browser    ${URL}    ${BROWSER}
     Take Screenshot      fullPage=False   filename=viewPage   fileType=jpeg    quality=50    timeout=10s
    Take Screenshot   EMBED
    
    Take Screenshot   fullPage=True  filename=entirePage  fileType=jpeg    quality=50    timeout=10s
    Take Screenshot   EMBED