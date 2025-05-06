*** Settings ***
Library    SeleniumLibrary
Resource     ../resource/EPM-Resource.robot
Library    FakerLibrary


*** Keywords ***
Redirect to Add Area of Assignment Module
    Go To  ${baseURL}areaAssignmentManagement.php

Add Area of Assignment

    ${fake_text}=    FakerLibrary.Company
    
    ${area_assignment_full}=    Set Variable    ${fake_text} - SWAD DUMMY TEST INITIAL 
  
    Wait Until Element Is Visible    id=btnAdd    5s
    Click Button    id=btnAdd

    Wait Until Element Is Visible    id=txtAreaAssignmentName    5s
    Input Text    id=txtAreaAssignmentName    ${area_assignment_full}

    Select From List By Value    id=txtAreaAssignmentDiv    2
    Select From List By Value    id=txtAreaAssignmentUnit    17
    Select From List By Value    id=txtAreaAssignmentOfficeLocation    16

    Click Button    xpath=//*[@id="frmAdminAreaAssignmentAdd"]/div[3]/button[2]

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    ID:modalDynamicButton

Update Area of Assignment
    
    ${fake_text}=    FakerLibrary.Company
    
    ${area_assignment_full}=    Set Variable    ${fake_text} - SWAD DUMMY TEST INITIAL 

    FOR    ${i}    IN RANGE    2
        Execute JavaScript    document.querySelectorAll('#tblAreaAssignment thead tr th')[7].click()
        Sleep    1s
    END
    
    Sleep    2s

    Wait Until Element Is Visible    xpath=//table[@id='tblAreaAssignment']//tr[td[contains(translate(., 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 'SWAD DUMMY TEST INITIAL')]]//button[contains(text(), 'Update')]    5s
    Click Element     xpath=//table[@id='tblAreaAssignment']//tr[td[contains(translate(., 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 'SWAD DUMMY TEST INITIAL')]]//button[contains(text(), 'Update')] 
    
    Wait Until Element Is Visible    id=txtUpdateAreaAssignmentName    2s
    Input Text    id=txtUpdateAreaAssignmentName    ${area_assignment_full}

    Wait Until Element Is Visible     xpath=//*[@id="frmAdminAreaAssignmentUpdate"]/div[3]/button[2]   2s
    Click Button    xpath=//*[@id="frmAdminAreaAssignmentUpdate"]/div[3]/button[2]

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    id:modalDynamicButton

Remove Area of Assignment    
    FOR    ${i}    IN RANGE    2
        Execute JavaScript    document.querySelectorAll('#tblAreaAssignment thead tr th')[7].click()
        Sleep    1s
    END

    Wait Until Element Is Visible    xpath=//table[@id='tblAreaAssignment']//tr[td[contains(translate(., 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 'SWAD DUMMY TEST INITIAL')]]//button[contains(text(), 'Remove')]    2s
    Click Element     xpath=//table[@id='tblAreaAssignment']//tr[td[contains(translate(., 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 'SWAD DUMMY TEST INITIAL')]]//button[contains(text(), 'Remove')] 

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    id:modalDynamicButton

    
   
    