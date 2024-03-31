*** Settings ***
Documentation  This is some basic test for checking the error of a login page
Library  SeleniumLibrary
Library  Collections
Library  String
Test Setup  open the browser
Test Teardown   Close browser
Resource  resource.robot
          #Test teardown #---- keyword for something that is executed at the end of the test


*** Variables ***
${Error_Message_Login}        css:.alert-danger

*** Test Cases ***
Validate Child window functionality
    Select the window of child window
    Verify that window is switched to child window
    Grab email ID in the child window
    Switch to parrent window and enter the email



*** Keywords ***
Select the window of child window
    click element       css:.blinkingText
    sleep               5s



Verify that window is switched to child window
    Switch Window       NEW
    Element Text Should be      css:h1         DOCUMENTS REQUEST


Grab email ID in the child window
    ${text}=    get text    css:.red
    @{words}=   Split String    ${text}     at
    ${text_split}=  Get From List     ${words}    1
    Log     ${text_split}
    @{mail_split}=  Split String    ${text_split}
    ${mail}=    Get From List   ${mail_split}  0
    Set Global Variable         ${mail}


Switch to parrent window and enter the email
    Switch Window           MAIN
    sleep               3s
    Title Should Be     LoginPage Practise | Rahul Shetty Academy
    Input Text          id = username           ${mail}
    Textfield Should Contain        id = username       ${mail}
    sleep               3s