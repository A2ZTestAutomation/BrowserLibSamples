*** Settings ***
Library    AppiumLibrary   

*** Variables ***
${REMOTE_URL}           http://localhost:4723/wd/hub
${PLATFORM_NAME}        Android
${PLATFORM_VERSION}        11.0
${DEVICE_NAME}        emulator-5554
${PACKAGE_NAME}         com.android.contacts
${Activity_NAME}        com.android.contacts.activities.PeopleActivity
                   
*** Keywords ***
Open Contact App
  Open Application   ${REMOTE_URL}
  ...     platformName=${PLATFORM_NAME}
  ...     platformVersion=${PLATFORM_VERSION}
  ...     deviceName=${DEVICE_NAME}
  ...     automationName=UiAutomator2
  ...     newCommandTimeout=2000
  ...     appActivity=${Activity_NAME}
  ...     appPackage=${PACKAGE_NAME}

*** Test Cases ***
Create Contact Test
    Open Contact App 
    
    Click Element    id=com.android.contacts:id/floating_action_button
    sleep    2s
    Click Element   id=com.android.contacts:id/left_button
    sleep    2s
    ${elements}    Get Webelements    xpath=//*[@class='android.widget.EditText']
    Click Element    ${elements}[0]
    Input Text    ${elements}[0]    AVD 
    Input Text    ${elements}[1]    77777777    
    click element     com.android.contacts:id/editor_menu_save_button

Search Contact Test
    Open Contact App
    sleep     2s
    Click Element    id=com.android.contacts:id/menu_search
    Input text    com.android.contacts:id/search_view    AVD
    ${elements}    Get Webelements    xpath=//*[@class='android.widget.TextView']
      
    FOR    ${element}    IN    @{elements}
      Element Should Contain Text    ${element}    AVD 
      Exit For Loop      
    END
    Click Element    ${elements}[0] 
    