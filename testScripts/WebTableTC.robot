*** Settings ***
Library    Browser

*** Variables ***

*** Test Cases ***
WebTable Validations

  #    New Browser    chromium    headless=false     
  #    Set Browser Timeout    timeout=30s
  #    New Page    https://testautomationpractice.blogspot.com/    
  
  #  ${table}=       Get Element     table#taskTable
   
  #   ${row}    Get Element Count    table#taskTable tbody tr
  #   ${col}    Get Element Count    table#taskTable thead tr th
    
  #   Log To Console    "Number of Rows: ",${row}    
  #   Log To Console    "Number of Col : ",${col}    
    
  #     # To get data from particular cell
  #   #CPU load of Chrome process: 3.8%
  #   ${rowIndex}    Get Table Row Index    table#taskTable >> "System"   
  #   Log To Console  "Row Index: ",${rowIndex} 
  #   ${colIndex}    Get Table cell Index    table#taskTable >> "Memory (MB)"
  #   Log To Console     "Column Index: ",${colIndex}
  #     ${cellData}     Get Table Cell Element    ${table}    "Memory (MB)"     "System" 
  #     # ${cellData}     Get Table Cell Element    ${table}    3    1
     

  #     ${cellText}   Get Text    ${cellData}

  #     Log Many    ${cellText}
   

Table Validations from BrowserLibrary
     New Browser    chromium    headless=false     
     Set Browser Timeout    timeout=30s
     New Page    https://marketsquare.github.io/robotframework-browser/Browser.html   

   ${table}=    Set Variable    [id="Get Table Cell Element"] >> div.kw-docs table >> nth=1
          ${e}=    Get Table Cell Element    ${table}    "Real Name"    "aaltat"   # Returns element with text Tatu Aalto
          Get Text    ${e}    ==    Tatu Aalto
          ${e}=    Get Table Cell Element    ${table}    "Slack"    "Mikko Korpela"   # Returns element with text @mkorpela
          Get Text    ${e}    ==    @mkorpela
          # ${e}=    Get Table Cell Element    ${table}    "mkorpela"    "Kerkko Pelttari"   # column does not need to be in row 0
          # Get Text    ${e}    ==    @mkorpela
          ${e}=    Get Table Cell Element    ${table}    2    -1   # Index is also directly possible
          Get Text    ${e}    ==    René Rohner
          

Table Validations from UiAutomation
#      New Browser    chromium    headless=false     
#      Set Browser Timeout    timeout=30s
#      New Page    http://uitestingplayground.com/dynamictable   
#      ${table}    Get Element    div[role='table']
#      ${rowIndex}    Get Table Row Index    ${table} >> "System"
#      Log To Console     ${rowIndex}