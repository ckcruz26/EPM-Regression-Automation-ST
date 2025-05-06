*** Settings ***

Library    SeleniumLibrary


*** Variables ***
${baseURL}            https://172.31.32.64/registration/
${browserName}        Chrome
${personnelUN}        12456
${personnelPW}        P@ssw0rd


*** Keywords ***
#General Reuse
Open WebApp using Edge
    Open Browser    ${baseURL}    ${browserName}    
...    options=add_argument("--ignore-certificate-errors")
# --headless
    Maximize Browser Window
    
