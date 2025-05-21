*** Settings ***

Library             Browser     

Suite Teardown      Close Browser    

*** Variables ***
${URL}        http://uitestingplayground.com/autowait
${BROWSER}    chromium

*** Test Cases ***
Using Browser Timeout
        New Browser    ${BROWSER}    headless=false     
        New Page     ${URL}
        Select Options By     \#element-type    index    2
        ${selectedElemType}    Get Selected Options    \#element-type
        Log To Console    ${selectedElemType}

        #Select options to make Textarea editable only after 10 sec
        Uncheck Checkbox    \#visible
        Uncheck Checkbox    \#enabled
        Uncheck Checkbox    \#ontop
        Uncheck Checkbox    \#nonzero

        #Since the default wait time is 10s, the below click will fail
        # Click    \#applyButton10

        #But on setting the browser timeout to 15s, the below click will pass
       
#        Set Browser Timeout    timeout=15s

       Click    \#applyButton10

       # This will pass because default is 10s. Will work without setting the timeout
       #  Click    \#applyButton5
   
        # Wait For Elements State    \#target    editable    timeout=15s
        Wait For Elements State    \#target    editable   timeout=15s
        Click    \#target
        Fill Text    \#target    Textarea is allowing to enter text  
        Get Text     \#target      ==      Textarea is allowing to enter text  
        
        # Sleep    5s
        # ${lblElem}    Get Element    \#opstatus    
        # ${lblText}    Get Text    ${lblElem}    ==    Target element state restored.
       


        
        
Using PageLoad Timeout
        New Browser    ${BROWSER}    headless=false     
        New Page     http://uitestingplayground.com/
        #Since page  timeout is 10s, the below click will fail
        # Set Browser Timeout    5s
        #Without setting the Browser timeout, the below click will pass
        Click    "Load Delay"
        Wait For Load State    load    
   
        Click    "Button Appearing After Delay"
        Sleep    2s
        Log To Console    Page loaded successfully
        #This will pass if the page is loaded 
         Get Url    contains    loaddelay
      
