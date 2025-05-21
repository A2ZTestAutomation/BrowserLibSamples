*** Settings ***
Library             Browser
*** Variables ***
${URL}        https://the-internet.herokuapp.com/iframe
${BROWSER}    chromium

*** Test Cases ***
Handling multiple frames
    Open Browser    ${URL}     ${BROWSER}
    ${label}    Get Text    div > h3
    Log     The text is : ${label}
   
    ${txtFromFrame}     Get Text   iframe#mce_0_ifr >>> id=tinymce       
    Log     ${txtFromFrame}

    ${txtFromPage}    Get text     span.tox-statusbar__branding    
    Log     ${txtFromPage}
        
          
    
    
    
    
    
    
    