*** Settings ***
Library    Browser

*** Variables ***
${browser}    chromium

*** Test Cases ***
Valid Login
    Given browser is opened to login page
    When user "tomsmith" logs in with password "SuperSecretPassword!"
    Then should display success message

*** Keywords ***
Browser is opened to login page
     open browser    https://the-internet.herokuapp.com/login   ${browser}

User "${username}" logs in with password "${password}"
    Type Text  \#username     ${username}
    type text  \#password     ${password}
    click    button.radius

should display success message
    ${flashMessage}    get text    \#flash     *=     You logged into a secure area!
    # Get Text    \#flash  *=     You logged into a secure area! 