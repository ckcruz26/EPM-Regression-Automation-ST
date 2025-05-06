*** Settings ***
Library    SeleniumLibrary
Resource     ../resource/EPM-Resource.robot
Library    FakerLibrary

*** Variables ***
@{filters_val}         10    25    50    100


*** Keywords ***
Redirect to Generate List Module
    Go To  ${baseURL}generateList.php

For Payroll Generation
    Wait Until Element Is Visible    id=downloadforPayrollList    2s
    Click Element    id=downloadforPayrollList


    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes


Filtering Values 

    FOR    ${value}    IN     @{filters_val}
        Wait Until Element Is Visible    xpath=//*[@id="tblFMDGenerateList_length"]/label/select    2s
        Select From List By Value    xpath=//*[@id="tblFMDGenerateList_length"]/label/select        ${value} 
        Sleep    2S
    END
