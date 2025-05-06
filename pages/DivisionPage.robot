*** Settings ***
Library    SeleniumLibrary
Resource     ../resource/EPM-Resource.robot
Library    FakerLibrary


*** Keywords ***

Redirect to Division Module
    Go To  ${baseURL}divisionManagement.php


Add Division Name

    ${division_faker} =  FakerLibrary.Company
    ${division_faker_code} =     FakerLibrary.Company Suffix
    ${divi_full_name} =  Set Variable    SWAD - ${division_faker} - DUMMY DIVISION TEST
    ${divi_code} =     Set Variable    SWAD - ${division_faker_code} - DUMMY DIVISION CODE TEST

    Wait Until Element Is Visible    id=btnAdd    2s
    Click Button    id=btnAdd

    Wait Until Element Is Visible    id=txtDivName    2s
    Input Text    id=txtDivName    ${divi_full_name}

    Wait Until Element Is Visible    id=txtDivNameCode   2s
    Input Text    id=txtDivNameCode    ${divi_code}

    Select From List By Value    id=txtCluster        3

    Click Button    xpath=//*[@id="frmAdminDivisionAdd"]/div[3]/button[2]

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    ID:modalDynamicButton    

Update Division

    ${division_faker} =  FakerLibrary.Company
    ${division_faker_code} =     FakerLibrary.Company Suffix
    ${divi_full_name} =  Set Variable    SWAD - ${division_faker} - DUMMY DIVISION TEST
    ${divi_code} =     Set Variable    SWAD - ${division_faker_code} - DUMMY DIVISION CODE TEST

    FOR    ${i}    IN RANGE    2
        Execute JavaScript    document.querySelectorAll('#tblDivision thead tr th')[4].click()
        Sleep    1s
    END

    Sleep    2s

    Wait Until Element Is Visible    xpath=//table[@id='tblDivision']//tr[td[contains(translate(., 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 'DUMMY DIVISION TEST')]]//button[contains(text(), 'Update')]    5s
    Click Element                    xpath=//table[@id='tblDivision']//tr[td[contains(translate(., 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 'DUMMY DIVISION TEST')]]//button[contains(text(), 'Update')]
    
    Wait Until Element Is Visible    id=txtUpdateDivName    2s
    Input Text    id=txtUpdateDivName    ${divi_full_name}

    Wait Until Element Is Visible    id=txtUpdateDivNameCode   2s
    Input Text    id=txtUpdateDivNameCode    ${divi_code}

    Wait Until Element Is Visible    xpath=//*[@id="formAdminDivisionUpdate"]/div[3]/button[2]    2s
    Click Button    xpath=//*[@id="formAdminDivisionUpdate"]/div[3]/button[2]

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    ID:modalDynamicButton

Remove Division

    FOR    ${i}    IN RANGE    2
        Execute JavaScript    document.querySelectorAll('#tblDivision thead tr th')[4].click()
        Sleep    1s
    END

    Sleep    2s

    Wait Until Element Is Visible    xpath=//table[@id='tblDivision']//tr[td[contains(translate(., 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 'DUMMY DIVISION TEST')]]//button[contains(text(), 'Remove')]    5s
    Click Element                    xpath=//table[@id='tblDivision']//tr[td[contains(translate(., 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 'DUMMY DIVISION TEST')]]//button[contains(text(), 'Remove')]

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    ID:modalDynamicButton
