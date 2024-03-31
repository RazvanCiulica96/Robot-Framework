*** Settings ***
Documentation  This is some basic test for checking the error of a login page
Library         SeleniumLibrary
Library         Collections
Library         ../customLibraries/Shop.py
Resource        resource.robot
Test Setup                  open the browser
Test Teardown               close browser session
          #Test teardown #---- keyword for something that is executed at the end of the test



*** Variables ***
${Error_Message_Login}        css:.alert-danger
${Shop_Page_Load}         css:.nav-link
${listofProducts}         Blackberry    Nokia Edge

*** Test Cases ***
Validate Unsucessfull Login

    fill in the login form      ${user_name}   ${invalid_password}
    wait for element to be visible          ${Error_Message_Login}
    verify error message is correct

Validate Cards display in the Shopping List
    fill in the login form       ${user_name}              ${valid_password}
    wait for element to be visible          ${Shop_Page_Load}
    Verify Card titles in the Shop page
    hello_world
    add items to card and checkout          ${listofProducts}
    #Select the Card         Blackberry

Select the Form and navigate to child window
    fill the login details and form



*** Keywords ***

fill in the login form
    [arguments]             ${user}                     ${pass}
    input text              id = username                   ${user}
    input text              id = password                   ${pass}
    click button            name = terms
    click button            id = signInBtn


verify error message is correct
    ${result} =     get text             ${Error_Message_Login}
    should be equal as strings           ${result}          Incorrect username/password.
    Element text should be               ${Error_Message_Login}   Incorrect username/password.
    sleep               3s

wait for element to be visible
    [arguments]                          ${element}
    wait until element is visible        ${element}


Verify Card titles in the Shop page
    @{expectedList} =   Create List         iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${elements}=        Get WebElements     css:.card-title
    @{Actual_list} =    Create List
    FOR   ${element}  IN            @{elements}
          log                ${element.text}
          append to list     ${Actual_list}         ${element.text}
    END
    Lists Should Be Equal       ${expectedList}         ${Actual_list}



fill the login details and form
    input text              id = username                   rahulshettyacademy
    input text              id = password                   learning
    click element           css:input[value="user"]
    Wait Until Element Is Visible       css:.modal-body
    click button           id = okayBtn
    click button           id = okayBtn
    Wait Until Element Is Not Visible   css:.modal-body
    select from list by value       css:select.form-control             teach
    select checkbox        name = terms
    checkbox should be selected     name = terms
    click button            id = signInBtn
    sleep                   5s

Select the Card
    [arguments]     ${cardName}
    ${elements}=    Get WebElements     css:.card-title
    ${index}=   Set Variable    1
     FOR   ${element}  IN            @{elements}
          Exit For Loop If      '${cardName}' == '${element.text}'
          ${index}=  Evaluate   ${index} + 1

     END
    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button