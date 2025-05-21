*** Settings ***
Library    Browser    

Suite Setup  New Browser   chromium    headless=false    
*** Test Cases ***
Mouse Right Click Test
  
    New Page    http://swisnl.github.io/jQuery-contextMenu/demo.html
    Click With Options     text=/^right .*$/   right    
    # sleep     2s
    ${promise} =       Promise To    Wait For Alert    action=accept    text= clicked: copy
    Click    css=ul.context-menu-list.context-menu-root > li:nth-child(3)
    ${text} =          Wait For      ${promise}
    # sleep    1s
    
Mouse Double Click Test
    New Page   https://testautomationpractice.blogspot.com/    
    Type Text    id=field1    Hello Welcome
    Click With Options    //button[contains(text(), 'Copy Text')]    clickCount=2
    sleep    3s
    
Mouse Drag and Drop Test
    New Page   https://testautomationpractice.blogspot.com/  
    Scroll By   ${Empty}    vertical=1200
    sleep    3s
     Drag And Drop    id=draggable    id=droppable
     sleep    3s
     Close Browser
    

Mouse Hover Test
    New Page   https://testautomationpractice.blogspot.com/  
    Scroll To Element      text=/^Point Me/  
    sleep    3s
    Hover     text=/^Point Me/   
    ${item} =    Get Element   div.dropdown-content > a:nth-child(2)
    Click      ${item}
    sleep    3s

# Right Click Test
#     New Page   https://testautomationpractice.blogspot.com/  
#     Scroll To Element      input#field2
#     sleep    2s
#     Click With Options   input#field2  right
#     sleep    3s
#     Close Browser