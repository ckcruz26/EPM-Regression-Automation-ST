*** Settings ***
Library    SeleniumLibrary
Resource     ../resource/EPM-Resource.robot


*** Keywords ***
Redirect to Dashboard
    Go To  ${baseURL}dashboard.php