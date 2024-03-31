*** Settings ***
Documentation  All the page objects and keywords of landing page
Library  SeleniumLibrary
Resource  resource.robot

*** Variables ***
${Error_Message_Login}        css:.alert-danger

*** Keywords ***
fill in the login form
    [arguments]             ${user}                     ${pass}
    input text              id = username                   ${user}
    input text              id = password                   ${pass}
    click button            name = terms
    click button            id = signInBtn


wait for element to be visible
    Wait Until element passed is located on Page        ${Error_Message_Login}

verify error message is correct
    ${result} =     get text             ${Error_Message_Login}
    should be equal as strings           ${result}          Incorrect username/password.
    Element text should be               ${Error_Message_Login}   Incorrect username/password.
    sleep               3s


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