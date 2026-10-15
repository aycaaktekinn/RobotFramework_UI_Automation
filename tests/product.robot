*** Settings ***
Resource    ../resources/ui_keywords.robot
Test Setup       Open Login Page
Test Teardown    Close Browser

*** Test Cases ***
Add Product To Cart
    [Tags]    ui    smoke    product
    Login With Credentials    ${USERNAME}    ${PASSWORD}
    Click Button    id:add-to-cart-sauce-labs-backpack
    Page Should Contain Element    class:shopping_cart_badge
    Element Text Should Be    class:shopping_cart_badge    1
    Click Element    class:shopping_cart_link
    Page Should Contain    Sauce Labs Backpack