*** Settings ***
Library             Browser
# In    case of excel
# Library    DataDriver    file=../testData/loginData.xlsx    sheet_name=loginPage
Library    DataDriver    file=loginData.xlsx    sheet_name=loginPage
# In case of csv file - DataDrivenTC.csv
Library             DataDriver
Resource            resource.robot
Suite Setup         Open Browser To Login Page
Test Template       Invalid Login
*** Variables ***
${username}     ${EMPTY}
${password}     ${EMPTY}

*** Test Cases ***
 Login with user ${username} and password ${password}    Default    UserData

*** Keywords ***
Invalid Login
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    Input Password    ${password}
    Submit Credentials
    Login Should Have Failed    ${errMsg}
    # Login should have passed    ${successMsg}

# Valid login

#    [Arguments]    ${username}    ${password}
#    Input Username    ${username}
#    Input Password    ${password}
#    Submit Credentials
#    Sleep    2s
#    Login should have passed    ${successMsg}
