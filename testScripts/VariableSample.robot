*** Settings ***
Library    Browser   
Library    OperatingSystem
  

*** Variables ***
${BROWSER}            chromium
${DELAY}              5
${env}          dev
&{URL}    qa=http://qa.demo.com    dev=http://dev.demo.com    test=http://test.demo.com


*** Test Cases ***
Using Scalar Variable Values
 
    Log    ${URL.${env}}
    Log    This ${BROWSER} session has delay time of ${DELAY} Seconds 
    
Using List
    
    @{userDetail} =  Create List     John     Peter      aaa@gmail.com     9778655
    Log Many   @{userDetail}
    Log       "First Name : ",${userDetail}[1]
    Open Browser   https://www.demoblaze.com/#    chromium   

    Sleep    5s    
    @{elements_list}    Get Elements    h4.card-title 
    Log Many    @{elements_list}
    FOR    ${element}    IN    @{elements_list}
        ${itemName}    Get Text      ${element}
        Log To Console    ${itemName}
    END
    Close Browser

Using Dictionary
    &{dictItems} =    Create Dictionary   a=10    b=20    c={30,40,50}
    Log To Console  "Value of a",${dictItems.a}    
    Log To Console  "Value of b",${dictItems}[b]
    Log Many    "Items in Dictionary",&{dictItems}
    Log Many    "Value of c",${dictItems}[c]
    Log To Console   "Item in c",${dictItems}[c][2]
    &{user} =   Create Dictionary    name=John    password=welcome123
    Log  "UserName is :",${user}[name], "Password is :",${user.password} 
    Should Be Equal    ${user}[name]    John
    &{books} =     Create Dictionary    book1={id=1, name=Robot}     book2={id=2, name=Python}
    Log To Console    "List of books : ",${books}[book1]
    
   
Using Environment Variable
    Log to console    ${url.dev}
    log to console    ${url.${env}}
  
Using System variables
    Log To Console   Current user: %{USERNAME}
    Run    %{JAVA_HOME}${/}javac
    Run    ${CURDIR}${/}robot FirstTC.robot
    # Log To Console  "Current working directory: ",%{PWD}


    
    
    
    
    
    

      
   