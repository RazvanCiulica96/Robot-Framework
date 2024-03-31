*** Settings ***
Documentation  This is some basic test for checking the error of a login page
Library  SeleniumLibrary
Test Teardown   Close browser
          #Test teardown #---- keyword for something that is executed at the end of the test


*** Variables ***
${Error_Message_Login}        css:.alert-danger

*** Test Cases ***
Validate Unsucessfull Login
    open the browser
    fill in the login form
    verify error message is correct



*** Keywords ***
open the browser
    log                 starting the browser
    open browser        https://rahulshettyacademy.com/loginpagePractise/   chrome

    wait until page contains                (username is rahulshettyacademy and Password is learning)
fill in the login form
    input text              id = username                   rahulshettyacademy
    input text              id = password                   12345
    click button            name = terms
    click button            id = signInBtn
    wait until element is visible               ${Error_Message_Login}

verify error message is correct
    ${result} =     get text             ${Error_Message_Login}
    should be equal as strings           ${result}          Incorrect username/password.
    Element text should be               ${Error_Message_Login}   Incorrect username/password.
    sleep               3s

