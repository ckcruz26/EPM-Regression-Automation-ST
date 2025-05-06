*** Settings ***
Library    SeleniumLibrary
Resource     ../resource/EPM-Resource.robot
Library    FakerLibrary



*** Keywords ***
Redirect to Program Course Module
    Go To  ${baseURL}courses.php


Add Program Course 
    
    ${course_faker} =    FakerLibrary.Job
    ${course_full} =  Set Variable    ${course_faker} - DUMMY COURSE
    ${course_ini} =     Set Variable    ${course_faker} - INITIAL DUMMY
    Wait Until Element Is Visible    id=btnAdd    5s
    Click Button    id=btnAdd

    Wait Until Element Is Visible    id=AddCourseTitle    5s
    Input Text    id=AddCourseTitle    ${course_full}

    Wait Until Element Is Visible    id=AddCourseInitial    5s
    Input Text    id=AddCourseInitial    ${course_ini}

    Wait Until Element Is Visible    xpath=//*[@id="frmProgramCourseAdd"]/div[3]/button[2]
    Click Button    xpath=//*[@id="frmProgramCourseAdd"]/div[3]/button[2]

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    ID:modalDynamicButton    

Update Program Course

    ${update_course_faker} =    FakerLibrary.Job
    ${update_course_full} =  Set Variable    ${update_course_faker} - DUMMY COURSE
    ${update_course_ini} =     Set Variable    ${update_course_faker} - INITIAL DUMMY

    FOR    ${i}    IN RANGE    2
        Execute JavaScript    document.querySelectorAll('#tblManageProgramCourse thead tr th')[4].click()
        Sleep    1s
    END

    Sleep    5s

    Wait Until Element Is Visible    xpath=//table[@id='tblManageProgramCourse']//tr[td[contains(translate(., 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 'DUMMY COURSE')]]//button[contains(text(), 'Update')]    5s
    Click Element                    xpath=//table[@id='tblManageProgramCourse']//tr[td[contains(translate(., 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 'DUMMY COURSE')]]//button[contains(text(), 'Update')]
    
    Wait Until Element Is Visible    id=updateCourseTitle    5s
    Clear Element Text               id=updateCourseTitle
    Input Text                       id=updateCourseTitle    ${update_course_full}

    Wait Until Element Is Visible    id=updateCourseInitial    5s
    Clear Element Text               id=updateCourseInitial
    Input Text                       id=updateCourseInitial    ${update_course_ini}

    Wait Until Element Is Visible    xpath=//*[@id="frmProgramCourseUpdate"]/div[3]/button[2]
    Click Button    xpath=//*[@id="frmProgramCourseUpdate"]/div[3]/button[2]

    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    ID:modalDynamicButton

Remove Program Course 
    Sleep    5s
    FOR    ${i}    IN RANGE    2
        Execute JavaScript    document.querySelectorAll('#tblManageProgramCourse thead tr th')[4].click()
        Sleep    1s
    END

    Sleep    5s

    Wait Until Element Is Visible    xpath=//table[@id='tblManageProgramCourse']//tr[td[contains(translate(., 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 'DUMMY COURSE')]]//button[contains(text(), 'Delete')]    5s
    Click Element                    xpath=//table[@id='tblManageProgramCourse']//tr[td[contains(translate(., 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), 'DUMMY COURSE')]]//button[contains(text(), 'Delete')]
    
    Wait Until Element Is Visible    id:modalDynamicConfirmButtonYes    10s
    Click Button    id:modalDynamicConfirmButtonYes

    Wait Until Element Is Visible    id:modalDynamicMessage    10s
    Click Button    ID:modalDynamicButton