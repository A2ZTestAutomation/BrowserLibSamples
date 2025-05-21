*** Settings ***

Resource    AppResource.resource
Variables    ../pages/checkoutPage.py

*** Variables ***
${firstNameValue}     Test
${firstNameValue}     User
${postalCodeValue}    12345
${successMessage}      Thank you for your order!

*** Keywords ***
Provide User Details
    Type Text    ${firstName}    ${firstNameValue}
    Type Text    ${lastName}     ${firstNameValue}
    Type Text    ${postalCode}   ${postalCodeValue}
    Click    ${continueButton}
    sleep  3s

Confirm Order
   Click    ${finishButton}

Verify Order Summary
    Get Text   ${checkoutComplete}    ==    ${successMessage}
    