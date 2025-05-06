*** Settings ***
Library    SeleniumLibrary
Resource     ../resource/EPM-Resource.robot
Library    FakerLibrary


*** Keywords ***
Redirect to Position Name Module
    Go To  ${baseURL}positionName.php

Add a Position Name

    ${job}=    FakerLibrary.Job

    ${positionNum}=    Evaluate    str(random.randint(1, 4))    modules=random
    &{romanMap}=    Create Dictionary    1=I    2=II    3=III    4=IV
    ${roman}=    Set Variable    ${romanMap}[${positionNum}]
    
    ${full_text_job}=    Set Variable    ${job} - DUMMY TEST INITIAL ${roman}
    
    Wait Until Element Is Visible    xpath=//button[@id='btnAdd']
    Click Button    xpath=//button[@id='btnAdd']

    Wait Until Element Is Visible    id:addLPNPositionName 
    Input Text     id:addLPNPositionName    ${full_text_job}
    Wait Until Element Is Visible     id:addLPNPositionName 
    Input Text     id:addLPNPositionInitial    ${job}

    Click Button    xpath=//*[@id="frmPositionNameAdd"]/div[3]/button[2]

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    ID:modalDynamicButton

Update Position Name 
    ${rows}=    Get Element Count    xpath=//table[@id='tblManagePositionName']/tbody/tr
    ${job}=    FakerLibrary.Job

    ${positionNum}=    Evaluate    str(random.randint(1, 4))    modules=random
    &{romanMap}=    Create Dictionary    1=I    2=II    3=III    4=IV
    ${roman}=    Set Variable    ${romanMap}[${positionNum}]
    
    ${full_text_job}=    Set Variable    ${job} - DUMMY TEST INITIAL ${roman}

    FOR    ${i}    IN RANGE    2
        Execute JavaScript    document.querySelectorAll('#tblManagePositionName thead tr th')[4].click()
        Sleep    1s
    END

    Sleep    5s

    Wait Until Element Is Visible    xpath=//table[@id='tblManagePositionName']//tr[td[contains(translate(., 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 'DUMMY TEST INITIAL')]]//button[contains(text(), 'Update')]    5s
    Click Element                    xpath=//table[@id='tblManagePositionName']//tr[td[contains(translate(., 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 'DUMMY TEST INITIAL')]]//button[contains(text(), 'Update')]

    Wait Until Element Is Visible    id=updateLPNPositionName    5s
    Clear Element Text               id=updateLPNPositionName
    Input Text                       id=updateLPNPositionName    ${full_text_job}

    Wait Until Element Is Visible    id=updateLPNPositionInitial    5s
    Clear Element Text               id=updateLPNPositionInitial
    Input Text                       id=updateLPNPositionInitial    ${job}

    Wait Until Element Is Visible    xpath=//*[@id="frmPositionNameUpdate"]/div[3]/button[2]    5s
    Click Element                    xpath=//*[@id="frmPositionNameUpdate"]/div[3]/button[2]

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    ID:modalDynamicButton



Remove Position Name
    Sleep    5s
    FOR    ${i}    IN RANGE    2
        Execute JavaScript    document.querySelectorAll('#tblManagePositionName thead tr th')[4].click()
        Sleep    1s
    END

    Sleep    5s

    Wait Until Element Is Visible    xpath=//table[@id='tblManagePositionName']//tr[td[contains(translate(., 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 'DUMMY TEST INITIAL')]]//button[contains(text(), 'Delete')]    5s
    Click Element                    xpath=//table[@id='tblManagePositionName']//tr[td[contains(translate(., 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 'DUMMY TEST INITIAL')]]//button[contains(text(), 'Delete')]
    
    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    ID:modalDynamicButton