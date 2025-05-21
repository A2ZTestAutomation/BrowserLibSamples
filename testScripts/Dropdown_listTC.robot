*** Settings ***
Library        Browser     auto_closing_level=MANUAL
Library        Process
Suite Setup    Open Browser    ${URL}    ${BROWSER}    headless=False    
Test Teardown    

*** Variables ***
${URL}       https://testautomationpractice.blogspot.com/
${BROWSER}    chromium

*** Test Cases ***

Test Case to select dropdown values
        # New Browser     chromium   headless=False
        # New Context     viewport={'width': 1920, 'height': 1080}
        # New Page    ${URL}
        Scroll To Element    \#country
        Select Options By     \#country    Label    Japan
        ${countries}      Get Select Options    \#country    
        Log Many    ${countries}
        Select Options By     \#country    Index    3
        ${selectedCountry}    Get Selected Options    \#country
        # Set Browser Timeout    timeout=10s
        Wait For Elements State    \#country    selected 
        Log Many    ${selectedCountry}
       
Test Case to select values from List
        Scroll To Element    \#animals
        Select Options By    \#animals    Label    Cat     Elephant    Dog
        @{selectedValues}=  Get Selected Options    \#animals
        Log Many    @{selectedValues}































    
    