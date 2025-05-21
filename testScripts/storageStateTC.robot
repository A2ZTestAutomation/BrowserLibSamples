*** Settings ***
Library    Browser
*** Variables ***
${username}     corpdevops@gmail.com
${password}    conduit123
${stateStorageFile}    f:\\Anandhi\\workspace\\robotframework\\browser\\state\\storageState.json



*** Test Cases ***
Login Test Case
    New context     viewport={'width': 1420, 'height': 1080}
    New Browser    chromium    headless=false
    New Page    https://conduit-realworld-example-app.fly.dev/
    Click     ul.nav.navbar-nav.pull-xs-right > li:nth-child(2)
    #  Perform login
    Type Text    input[name='email']    ${username}
    Type Text    input[name='password']    ${password} 
    Click    button.btn.btn-lg.btn-primary.pull-xs-right
    Get Text    div h6    *=        Popular Tags
    #  Save storage to disk
#    ${stateStorageFile} =    Save Storage State
   ${state_file} =    Save Storage State
      Close Context
    #  Create new context with saved state
    # New context    storageState=${stateStorageFile} 
    New context    storageState=${state_file}
    #  New context     viewport={'width': 1420, 'height': 1080}
    New Page    https://conduit-realworld-example-app.fly.dev/
    #  Login is not needed because authentication is read from state file
     Get Text    div h6    *=        Popular Tags
     Sleep   5s

