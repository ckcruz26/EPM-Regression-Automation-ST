*** Settings ***
Library    SeleniumLibrary
Library      FakerLibrary
Resource    ../resource/EPM-Resource.robot
Resource    ../pages/ProfilePage.robot
Resource    ../suite-config-teardown/SuiteConfigTeardown.robot

Library    BuiltIn  # Add BuiltIn library to use the Skip keyword
# Suite Setup    Open Browser and Login
Test Teardown    Close Browser Interaction

*** Test Cases ***
[EPM_PROFILE_REGRESSION_ST_001]
    [Tags]     EPM_PROFILE_REGRESSION_ST_001
    Skip    This test is skipped due to issues.
    TRY
        Go To   https://172.31.32.64/registration/profile.php
        Change Password Form
        Verify Password Change Message
    EXCEPT    Error
        Fatal Error
    END

[EPM_PROFILE_REGRESSION_ST_002]
    [Tags]    EPM_PROFILE_REGRESSION_ST_002
    TRY
        Open Browser and Login
        Go To Profile Page
        Bank Details Form 
    EXCEPT    Error
        Fatal Error
    END

[EPM_PROFILE_REGRESSION_ST_003]
    [Tags]    EPM_PROFILE_REGRESSION_ST_003
    TRY
        Open Browser and Login
        Go To Profile Page
        Check If Overview Tab Is Active
    EXCEPT   Error
        Fatal Error
    END

[EPM_REGRESSION_PROFILE_ST_004]
    [Tags]    EPM_REGRESSION_PROFILE_ST_004
    TRY
        Open Browser and Login
        Go To Profile Page
        Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[2]/a
        Check If Basic Information Tab Is Active
        Fill Up Basic Information Form
    EXCEPT  Error
        Fatal Error
    END
[EPM_REGRESSION_PROFILE_ST_005]
    [Tags]    EPM_REGRESSION_PROFILE_ST_005
    TRY
        Open Browser and Login
        Go To Profile Page
        Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[3]/a
        Check If Other Information Tab Is Active
        Fill Up Other Information Form
    EXCEPT  Error
        Fatal Error
    END

[EPM_REGRESSION_PROFILE_ST_006]
    [Tags]    EPM_REGRESSION_PROFILE_ST_006
    TRY
        Open Browser and Login
        Go To Profile Page
        Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[4]/a
        Check If Family Background Tab Is Active
            FOR    ${i}    IN RANGE    3
                Add Family Background Form
            END
        Sleep    5s
    EXCEPT  Error
        Fatal Error
    END

[EPM_REGRESSION_PROFILE_ST_007]
    [Tags]    EPM_REGRESSION_PROFILE_ST_006
    # Skip    This test is skipped due to issues.
    TRY
        Open Browser and Login
        Go To Profile Page
        Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[4]/a
        Update Specific Family Background Form
    EXCEPT  Error
        Fatal Error
    END

[EPM_REGRESSION_PROFILE_ST_008]
    [Tags]    EPM_REGRESSION_PROFILE_ST_008
    TRY
        Open Browser and Login
        Go To Profile Page
        Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[4]/a
        Remove Specific Family
    EXCEPT  Error
        Fatal Error
    END

[EPM_REGRESSION_PROFILE_ST_012]
    [Tags]    EPM_REGRESSION_PROFILE_ST_012
    TRY
        Open Browser and Login
        Go To Profile Page
        Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[6]/a
        Check If Eligbility Tab Is Active
        FOR    ${i}    IN RANGE    3
            Add Eligibility Credentials 
        END
    EXCEPT  Error
        Fatal Error
    END

[EPM_REGRESSION_PROFILE_ST_013]
    [Tags]    EPM_REGRESSION_PROFILE_ST_013
    TRY
        Open Browser and Login
        Go To Profile Page
        Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[6]/a
        Check If Eligbility Tab Is Active
        Update Eligibility Credentials    
    EXCEPT  Error
        Fatal Error
    END

[EPM_REGRESSION_PROFILE_ST_014]
    [Tags]    EPM_REGRESSION_PROFILE_ST_014
    TRY
        Open Browser and Login
        Go To Profile Page
        Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[6]/a
        Check If Eligbility Tab Is Active
        Remove Eligibility Credentials 
    EXCEPT  Error
        Fatal Error
    END

[EPM_REGRESSION_PROFILE_ST_018]
    [Tags]    EPM_REGRESSION_PROFILE_ST_018
    TRY
        Open Browser and Login
        Go To Profile Page
        Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[8]/a
        Check If Voluntary Work Is Active
        Add Voluntary Work
    EXCEPT   Error
        Fatal Error
    END

[EPM_REGRESSION_PROFILE_ST_020]
    [Tags]    EPM_REGRESSION_PROFILE_ST_019
    TRY
        Open Browser and Login
        Go To Profile Page
        Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[8]/a
        Check If Voluntary Work Is Active
        Remove Voluntary Work
        Sleep   5s
    EXCEPT   Error
        Fatal Error
    END

[EPM_REGRESSION_PROFILE_ST_021]
    [Tags]    EPM_REGRESSION_PROFILE_ST_021
    TRY
        Open Browser and Login
        Go To Profile Page
        Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[9]/a
        Check If Training Tab Is Active
        Add Specific Training Form
    EXCEPT   Error
        Fatal Error
    END

[EPM_REGRESSION_PROFILE_ST_023]
    [Tags]    EPM_REGRESSION_PROFILE_ST_021
    TRY
        Open Browser and Login
        Go To Profile Page
        Click Element    xpath=/html/body/div[2]/div/section/div/div[2]/div/ul/li[9]/a
        Check If Training Tab Is Active
        Remove Specific Training
    EXCEPT   Error
        Fatal Error
    END