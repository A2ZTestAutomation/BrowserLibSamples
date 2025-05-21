*** Settings ***


Library     AxeLibrary
Library     SeleniumLibrary

*** Test Cases ***
Google Accessibility Test
    Open Browser    https://robotframework.org/    chrome
  # execute accessibility tests
    ${results.violations}   Run Accessibility Tests   result_file.json
    Log to console    Violations Count: ${results.violations}
    # # log violation result to log.html
    Log Readable Accessibility Result    violations
    # To get violations on log in json format
    Get Json Accessibility Result
    # Close Browser
