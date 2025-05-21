*** Settings ***
Library    Browser   
Library    Collections


*** Variables ***

*** Test Cases ***
Finding Elements by Implicit Selectors
    [Documentation]    This test case demonstrates how to find elements by locator.
     Open Browser    https://www.saucedemo.com/   chromium
     #Implicit selector strategy & default is css
     Type Text    \#user-name    standard_user
        Type Text    //input[@name='password']    secret_sauce
        #converted into text="Login" 
        #This search a button withe value="Login"
        Click    "Login"
Finding Elements by Explicit Selectors
    [Documentation]    This test case demonstrates how to find elements by locator.
     Open Browser    https://www.saucedemo.com/   chromium
     #Implicit selector strategy & default is css
     Type Text    css=#user-name    standard_user
        Type Text    xpath=//input[@name='password']    secret_sauce
       
        # Exact match Click    text="Login"
        Click    text="Login"
        
        #Locating many elements using CSS
        @{items}    Get Elements    .inventory_item_name 
        # Get the first element from the list
        ${first_item}    Get From List    ${items}    0
        # Get the text of the first element
        ${item_text}    Get Text    ${first_item}    ==    Sauce Labs Backpack
        Log    ${item_text}

  
Finding Elements by Explicit Selectors with RegEx
    [Documentation]    This test case demonstrates how to find elements by locator.
     #Implicit selector strategy & default is css

     Open Browser   https://testautomationpractice.blogspot.com/   chromium
    #Used to locate the element with text "PlaywrightPractice" - anchor tag
    #  Click    "PlaywrightPractice"

    #locating using RegEx - Element starting with Playwright and 
    # ending with any characters and 'i' represents case insensitive
    Click    text=/^Playwright.*$/i

    #Using CSS
    # ${pageHeading}    Get Element      h3.post-title.entry-title    

    #cascading selector
    #Locating 1st div inside div with class post-outer
    # and then locating the child element with class post-title.entry-title
    ${pageHeading}    Get Element     
    ...    //div[@class='post-outer']/div[1] >> .post-title.entry-title
    Get Text    ${pageHeading}     ==        PlaywrightPractice


   

    
