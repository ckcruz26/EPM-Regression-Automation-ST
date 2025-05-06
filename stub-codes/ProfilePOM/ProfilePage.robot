*** Settings ***
Library    SeleniumLibrary
Resource     ../resource/EPM-Resource.robot
Library    FakerLibrary
Library    BuiltIn
Library    random
Library    DateTime


*** Keywords ***
Change Password Form
    Click Button    id:openChangePassword
    Input Password    id:OldPassword    ${personnelPW}
    Input Password    id:NewPassword    ${forChangePassword}
    Input Password    id:ConfirmPassword   ${forChangePassword} 
    Click Button    id:modalDynamicConfirmButtonYes

Go To Profile Page
    Go To   https://172.31.32.64/registration/profile.php
Verify Password Change Message 
    Wait Until Element Is Visible    id:modalDynamicConfirmLogoutMessage
    Element Text Should Be           id:modalDynamicConfirmLogoutMessage    Your password has been successfully updated. Would you like to stay logged in or log out and sign in again with your new password?
    Click Button    id:modalDynamicConfirmLogoutButtonYes
Bank Details Form
    Wait Until Element Is Visible    id:frmBankDetails    10s
    Wait Until Element Is Visible    id:addBankAccount    10s
    Input Text    id:addBankAccount    37771888123
    Wait Until Element Is Enabled    id:btnSaveAccountNumber    10s
    Click Button    id:btnSaveAccountNumber
    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes
    Wait Until Element Is Visible    id:modalDynamicMessage    10s
Check If Overview Tab Is Active
    Page Should Contain Element    xpath=//li[contains(@class, 'active')]/a[@href='#overView']
Check If Basic Information Tab Is Active
    Page Should Contain Element    xpath=//li[contains(@class, 'active')]/a[@href='#basicInfo']
Check If Other Information Tab Is Active
    Page Should Contain Element    xpath=//li[contains(@class, 'active')]/a[@href='#otherInfo']
Check If Family Background Tab Is Active
    Page Should Contain Element    xpath=//li[contains(@class, 'active')]/a[@href='#familyBackground']

Check If Eligbility Tab Is Active
    Page Should Contain Element    xpath=//li[contains(@class, 'active')]/a[@href='#eligibility']

Check If Voluntary Work Is Active
    Page Should Contain Element    xpath=//li[contains(@class, 'active')]/a[@href='#voluntaryWork']

Check If Training Tab Is Active
    Page Should Contain Element    xpath=//li[contains(@class, 'active')]/a[@href='#training']


Fill Up Basic Information Form
    Wait Until Element Is Visible    id=AddRegion    10s
    Select From List By Value        id=AddRegion        030000000
    Wait Until Element Is Visible    id=AddProvince    10s
    Select From List By Value        id=AddProvince      031400000
    Wait Until Element Is Visible    id=AddCity    10s
    Select From List By Value        id=AddCity         031405000
    Wait Until Element Is Visible    id=AddZipCode    10s
    Input Text    id:AddZipCode    3017
    Wait Until Element Is Visible    id=AddMobileNo    10s
    Input Text    id:AddMobileNo    09285370995
    Wait Until Element Is Visible    id=AddEmail    10s
    Input Text    id:AddEmail    ckcruz@dswd.gov.ph
    Wait Until Element Is Enabled    id:btnUserBasicInfoUpdate    10s
    Click Button    id:btnUserBasicInfoUpdate
    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes
    Wait Until Element Is Visible    id:modalDynamicMessage    10s


Fill Up Other Information Form
    ${height}=    Evaluate    random.randint(150, 210)    random
    ${height_in_m}=    Evaluate    round(${height} / 100, 2)
    ${weight}=    Evaluate    random.randint(50, 70)    random
        
    ${bloodTypeVal}=    Evaluate    random.randint(1, 19)    random
    ${pagIbigNoVal}=    Numerify    %%%%-%%%%-%%%%
    ${philHealthVal}=    Numerify    21-%%%%%%%%%-%
    ${tinID}=    Numerify    %%%-%%%-%%%-%%%


    Wait Until Element Is Visible    id=PlaceOfBirth   10s
    Input Text    id=PlaceOfBirth    Bulakan
    Wait Until Element Is Visible    id:CivilStatus   10s
    Select From List By Value    id=CivilStatus    1
    Wait Until Element Is Visible    id=Height   10s
    Input Text    id=Height    ${height_in_m}
    Wait Until Element Is Visible    id=Weight   10s
    Input Text    id=Weight    ${weight}
    Wait Until Element Is Visible    id=BloodType   10s
    Select From List By Value    id=BloodType    ${bloodTypeVal}

    Wait Until Element Is Visible    id=pagibigNo   10s
    Input Text    id=pagibigNo    ${pagIbigNoVal}

    Wait Until Element Is Visible    id=philhealthNo   10s
    Input Text    id=philhealthNo    ${philHealthVal}

    Wait Until Element Is Visible    id=tinNo   10s
    Input Text    id=tinNo    ${philHealthVal}

    Wait Until Element Is Visible    id=tinNo   10s
    Input Text    id=tinNo    ${tinID}

    Wait Until Element Is Visible    id:btnUserUpdateOtherBasicInfo   10s
    Click Button    id:btnUserUpdateOtherBasicInfo

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes
    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    
Add Family Background Form

    ${given_name} =  FakerLibrary.first_name
    ${last_name} =  FakerLibrary.last_name
    ${relationValFaker}=    Evaluate    random.choice([2])    modules=random

    ${bday}=    Date Of Birth    minimum_age=20    maximum_age=30
    ${bday_formatted}=    Convert Date    ${bday}    %m/%d/%Y
    
    Wait Until Element Is Visible    id=relation   10s
    Select From List By Value    id=relation    ${relationValFaker}
    
    Wait Until Element Is Visible    id=FBSname   10s
    Input Text    id=FBSname    ${last_name}

    Wait Until Element Is Visible    id=FBFname   10s
    Input Text    id=FBFname    ${given_name}

    Wait Until Element Is Visible    id=FBDOB   10s
    Input Text    id=FBDOB    ${bday_formatted}
    
    Wait Until Element Is Visible    id:btnUserFamilyBackgroundAdd    10s
    Click Button    id:btnUserFamilyBackgroundAdd

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    ID:modalDynamicButton

Update Specific Family Background Form

    ${given_name} =  FakerLibrary.first_name
    ${last_name} =  FakerLibrary.last_name
    ${bday}=    Date Of Birth    minimum_age=20    maximum_age=30
    ${bday_formatted}=    Convert Date    ${bday}    %m/%d/%Y
    ${xpath}=     Set Variable    //*[@id="tblFBMember"]//tr[td[contains(text(), 'Children')]]//button[contains(text(), 'Update')]

    # Step 1: Click the "Update" button for the selected family member
    Click Element    xpath=${xpath}

    Wait Until Element Is Visible    id=updateFB    timeout=10s
    # Step 3: Wait for a short time to ensure the modal's transition or animations have completed
    Sleep    1s  # Wait for 1 second (you can adjust the duration if needed)

    # Step 4: Fill in the form fields
    Wait Until Element Is Visible    id=updateFBSname   10s
    Input Text    id=updateFBSname    ${last_name}

    Wait Until Element Is Visible    id=updateFBFname   10s
    Input Text    id=updateFBFname    ${given_name}

    Wait Until Element Is Visible    id=updateFBDOB   10s
    Input Text    id=updateFBDOB    ${bday_formatted}

    # # Step 5: Ensure the "Save" button is clickable and click it using JavaScript if necessary

     Click Element At Coordinates    xpath=//div[@class='modal-footer']//button[@id='btnUserFamilyBackgroundUpdate']  ${601}    ${544}
    # Wait Until Element Is Visible    id=btnUserFamilyBackgroundUpdate    10s
    # Click Button     id=btnUserFamilyBackgroundUpdate


    Sleep    0.3s
    
    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    ID:modalDynamicButton


Remove Specific Family
    ${xpath}=     Set Variable    //*[@id="tblFBMember"]//tr[td[contains(text(), 'Children')]]//button[contains(text(), 'Remove')]
    
    Click Element    xpath=${xpath}

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s\
    Click Button    ID:modalDynamicButton



Add Eligibility Credentials
    ${eligibilityVal}=    Evaluate    random.choice([11, 13, 21, 23, 30, 36, 43, 44, 47, 48, 50, 61, 62, 63, 69, 71, 80])    modules=random  
    ${eligibilityRatingVal}=     Evaluate    random.randint(80, 100)    random
    ${past_date_exam}=    Evaluate    (datetime.datetime.now() - datetime.timedelta(days=random.randint(1, 30))).strftime('%d-%m-%Y')    modules=random,datetime
    ${exam_place} =    FakerLibrary.City
    ${validity_val}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(days=random.randint(1, 30))).strftime('%d-%m-%Y')    modules=random,datetime
    ${file_path}=    Set Variable    C:/Users/ckcruz/Downloads/git-cheat-sheet.pdf


    Wait Until Element Is Visible    id=eligibilityCredentials   10s
    Select From List By Value    id=eligibilityCredentials    ${eligibilityVal}
    Wait Until Element Is Visible    id=eligibilityRating   10s
    Input Text    id=eligibilityRating    ${eligibilityRatingVal}
    Wait Until Element Is Visible    id=eligibilityExamDate   10s
    Input Text    id=eligibilityExamDate    ${past_date_exam}
    Wait Until Element Is Visible    id=eligibilityPlaceExamination   10s
    Input Text    id=eligibilityPlaceExamination      ${exam_place}
    Wait Until Element Is Visible    id=eligibilityNumber  10s
    Input Text    id=eligibilityNumber    1234567890
    Wait Until Element Is Visible   id=eligibilityValidityDate   10s
    Input Text    id=eligibilityValidityDate    ${validity_val}
    Choose File    id=eligibilityMOV   ${file_path}
    Click Button    xpath=//*[@id="frmUserEligibilitydAdd"]/div/div[2]/button
    
    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    ID:modalDynamicButton
    
Update Eligibility Credentials
    ${xpath_update}=     Set Variable    //*[@id="tblEligibility"]//tr[td[contains(text(), 'ENGINEER')]]//button[contains(text(), 'Update')]

    ${eligibilityVal}=    Evaluate    random.choice([11, 13, 21, 23, 30, 36, 43, 44, 47, 48, 50, 61, 62, 63, 69, 71, 80])    modules=random  
    ${eligibilityRatingVal}=     Evaluate    random.randint(80, 100)    random
    ${past_date_exam}=    Evaluate    (datetime.datetime.now() - datetime.timedelta(days=random.randint(1, 30))).strftime('%d-%m-%Y')    modules=random,datetime
    ${exam_place} =    FakerLibrary.City
    ${validity_val}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(days=random.randint(1, 30))).strftime('%d-%m-%Y')    modules=random,datetime
    ${file_path}=    Set Variable    C:/Users/ckcruz/Downloads/git-cheat-sheet.pdf
    
    Click Element    xpath=${xpath_update}

    Wait Until Element Is Visible    id=UpdateeligibilityRating   10s
    Input Text    id=UpdateeligibilityRating    ${eligibilityRatingVal}
    Wait Until Element Is Visible    id=UpdateeligibilityExamDate   10s
    Input Text    id=UpdateeligibilityExamDate    ${past_date_exam}
    Wait Until Element Is Visible    id=eligibilityPlaceExamination   10s
    Input Text    id=UpdateeligibilityPlaceExamination      ${exam_place}
    Wait Until Element Is Visible    id=UpdateeligibilityNumber  10s
    Input Text    id=UpdateeligibilityNumber    1234567890
    Wait Until Element Is Visible   id=UpdateeligibilityValidityDate   10s
    Input Text    id=UpdateeligibilityValidityDate    ${validity_val}
    Choose File    id=UpdateEligibilityMOV   ${file_path}
    Click Button   xpath=//*[@id="frmUserEligibilitydUpdate"]/div[2]/button[2]

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    ID:modalDynamicButton

Remove Eligibility Credentials
    ${xpath_remove}=     Set Variable    //*[@id="tblEligibility"]//tr[td[contains(text(), 'ENGINEER')]]//button[contains(text(), 'Remove')]

    Click Element    xpath=${xpath_remove}

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    ID:modalDynamicButton

Add Voluntary Work
    ${date_from}=    Evaluate    (datetime.datetime.now() - datetime.timedelta(days=random.randint(15, 30))).strftime('%d-%m-%Y')    modules=random,datetime
    ${date_to}=      Evaluate    (datetime.datetime.now() - datetime.timedelta(days=random.randint(1, 14))).strftime('%d-%m-%Y')    modules=random,
    
    ${org_name}=    FakerLibrary.company
    ${org_address}=    FakerLibrary.address

    ${job}=    FakerLibrary.Job

    Wait Until Element Is Visible    id=voluntaryNAO    10s
    Input Text    id=voluntaryNAO    ${org_name} + ${org_address}

    Click Element    id=voluntaryDateFrom
    Press Keys    id=voluntaryDateFrom    ${date_from}

    Wait Until Element Is Visible    id=voluntaryDateTo    10s
    Input Text    id=voluntaryDateTo    ${date_to}
    
    Wait Until Element Is Visible    id=voluntaryTotalHrs    10s
    Input Text    id=voluntaryTotalHrs    8
    
    Wait Until Element Is Visible    id=voluntaryPosition    10s
    Input Text    id=voluntaryPosition    ${job}

    Click Button    xpath=//*[@id="frmUserVoluntaryAdd"]/div/div[2]/button

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    ID:modalDynamicButton


Remove Voluntary Work
    ${xpath_remove}=     Set Variable    //*[@id="tblVoluntary"]//tr[td[contains(text(), '8')]]//button[contains(text(), 'Remove')]
       
    Click Button    xpath=${xpath_remove}
    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    ID:modalDynamicButton


Add Specific Training Form
    ${training_name}    FakerLibrary.Bs
    ${date_from}=    Evaluate    (datetime.datetime.now() - datetime.timedelta(days=random.randint(15, 30))).strftime('%d-%m-%Y')    modules=random,datetime
    ${date_to}=      Evaluate    (datetime.datetime.now() - datetime.timedelta(days=random.randint(1, 14))).strftime('%d-%m-%Y')    modules=random,
    ${first}=    FakerLibrary.First Name
    ${last}=     FakerLibrary.Last Name
    ${full_name}=    Catenate    SEPARATOR=    ${first} ${last}
    ${file_path}=    Set Variable    C:/Users/ckcruz/Downloads/git-cheat-sheet.pdf

    Input Text    id=trainingTitle    ${training_name}
    Input Text    id=trainingDateFrom    ${date_from}
    Input Text    id=trainingDateTo    ${date_to}
    Input Text    id=trainingHours    8
    Select From List By Value   id=trainingType    3
    Input Text    id=trainingConductedBy    ${full_name}
    Choose File    id=trainingUploadMOV    ${file_path}

    Click Button    xpath=//*[@id="frmUserTrainingAdd"]/div/div[2]/button

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    ID:modalDynamicButton

Remove Specific Training    
    ${xpath_remove}=     Set Variable    //*[@id="tbltraining"]//tr[td[contains(text(), 'TECHNICAL')]]//button[contains(text(), 'Remove')]
    
    Click Button    xpath=${xpath_remove}
    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    ID:modalDynamicButton