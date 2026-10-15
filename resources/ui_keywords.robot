*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}         https://www.saucedemo.com/
${BROWSER}     chrome
${USERNAME}    standard_user
${PASSWORD}    secret_sauce

*** Keywords ***
Open Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Login With Credentials
    [Arguments]    ${username}    ${password}
    Input Text        id:user-name       ${username}
    Input Password    id:password        ${password}
    Click Button      id:login-button