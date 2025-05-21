*** Settings ***
Library    AppiumLibrary  

*** Variables ***
${REMOTE_URL}           http://localhost:4723/wd/hub
${PLATFORM_NAME}        Android
${REAL_AND_VER}        7.0
${REALDEV_NAME}        LBFYHEPN7LGASKQS 
${BROWSER_NAME}        chrome
${username}     tomsmith
${password}     SuperSecretPassword!
                   
*** Keywords ***
Open Chrome Browser in RealDevice
  Open Application   ${REMOTE_URL}
  ...     platformName=${PLATFORM_NAME}
  ...     platformVersion=${REAL_AND_VER}
  ...     deviceName=${REALDEV_NAME}
  ...     automationName=UiAutomator2
  ...    newCommandTimeout=3000
  ...    browserName=${BROWSER_NAME}
 
*** Test Cases ***
Web App Test Case
        Open Chrome Browser in RealDevice
        Go To Url  https://the-internet.herokuapp.com/login
        Wait Until Page Contains Element    xpath=//input[@name="username"]      
        input text  xpath=//input[@name="username"]    ${username}
        input text  xpath=//input[@name="password"]    ${password}
        click Element  xpath=//form[@name="login"]/button
        

# Google Web App Test Base
       # # Launch Application
       # Open Chrome Browser in RealDevice
       # Go To Url  https://google.com   
       # Wait Until Page Contains Element   xpath=//input[@name="q"]    
         # input text  xpath=//input[@name="q"]     Cypress Testing
         # Input Value    xpath=//input[@name="q"]    KEYCODE_ENTER    
         # Click Element    
        # Press Keycode   KEYCODE_ENTER    
       
        