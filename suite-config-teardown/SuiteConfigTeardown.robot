***Settings***
Library    SeleniumLibrary

Resource    ../pages/LoginPage.robot
Resource    ../resource/EPM-Resource.robot

***Keywords***
Open Browser and Login
    Open WebApp using Edge
    LoginForm    ${personnelUN}    ${personnelPW}
    Verify Successful Message

Close Browser Interaction
    Close All Browsers