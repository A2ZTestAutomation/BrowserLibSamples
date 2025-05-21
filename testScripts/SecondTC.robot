*** Settings ***
Library  Browser

*** Variables ***
${browser}      chromium
  

*** Test Cases ***
Valid LoginTest

    New Browser    ${browser}    headless=false     
    New Page       https://the-internet.herokuapp.com/login        
    Fill Text  \#username     tomsmith
    Fill Text     \#password     SuperSecretPassword!
    click  \#login >> .radius
    Get Text   .flash.success    contains    You logged into a secure area!
    # Log To Console   ${successMsg}
    close browser 

Invalid LoginTest
    New Browser    chromium    headless=false
    New Page    https://the-internet.herokuapp.com/login
    Fill Text  \#username     tomsmith1
    Fill Text     \#password     SuperSecretPassword!
    click  \#login >> .radius
     Get Text   .flash.error    contains    invalid  
    
