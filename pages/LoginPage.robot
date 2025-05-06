*** Settings ***
Library    SeleniumLibrary


*** Keywords ***
LoginForm 
    [Arguments]    ${username}     ${password}
    Input Text    id:username    ${username}
    Input Password    id:password    ${password}
    Click Button    id:btn_submit

Verify Successful Message
    Sleep    2s
    Wait Until Element Is Visible      id:modalDynamicMessage
    Element Text Should Be    id:modalDynamicMessage     You have logged in successfully. Please close this modal to continue to the main page.
    Click Element   id:modalDynamicButton
Verify Error Message
    Sleep    2s
    Wait Until Element Is Visible      id:modalDynamicMessage
    Element Text Should Be    id:modalDynamicMessage     Oops! Invalid Credentials. Please contact HRPPMS-RSP for further assistance in verifying your information. 