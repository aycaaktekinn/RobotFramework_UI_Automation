*** Settings ***
Resource    ../resources/ui_keywords.robot
Test Setup       Open Login Page
Test Teardown    Close Browser

*** Test Cases ***
Successful Login
    [Tags]    ui    smoke    login
    Login With Credentials    ${USERNAME}    ${PASSWORD}
    Page Should Contain    Products

Invalid Password Login
    [Tags]    ui    regression    login
    Login With Credentials    ${USERNAME}    wrong_password
    Page Should Contain    Username and password do not match

Empty Login
    [Tags]    ui    regression    login
    Click Button    id:login-button
    Page Should Contain    Username is required