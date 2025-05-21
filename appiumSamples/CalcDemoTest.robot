*** Settings ***
Library    AppiumLibrary   

*** Variables ***
${REMOTE_URL}           http://localhost:4723/wd/hub
${PLATFORM_NAME}        Android
${PLATFORM_VERSION}        11.0
${DEVICE_NAME}        emulator-5554
${Activity_NAME}         com.android.calculator2.Calculator 
${PACKAGE_NAME}         com.google.android.calculator
                   


*** Keywords ***
Open calculator
  Open Application   ${REMOTE_URL}
  ...     platformName=${PLATFORM_NAME}
  ...     platformVersion=${PLATFORM_VERSION}
  ...     deviceName=${DEVICE_NAME}
  ...     automationName=UiAutomator2
  ...     newCommandTimeout=5000
  ...     appActivity=${Activity_NAME}
  ...     appPackage=${PACKAGE_NAME}
*** Test Cases ***
Calculator Test case
    Open calculator
    
    Click Element    id=com.google.android.calculator:id/digit_6
    Click Element    id=com.google.android.calculator:id/op_add
    Click Element    id=com.google.android.calculator:id/digit_4
  
    Element Should Contain Text    	com.google.android.calculator:id/result_preview    10
    
 