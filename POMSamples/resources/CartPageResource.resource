*** Settings ***

Resource    AppResource.resource
Variables    ../pages/cartPage.py

*** Variables ***

*** Keywords ***
Check Items Listed in Cart
   ${itemsList}      Get Elements  ${items}    
    ${itemsCount}     Get Length   ${itemsList}
    Should Be True    ${itemsCount} > 0   Items are listed in the cart
  
Checkout Items
    Click    ${chkoutBtn}
    sleep  3s

