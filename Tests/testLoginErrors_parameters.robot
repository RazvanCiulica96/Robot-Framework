*** Settings ***
Documentation  This is some basic test for checking the error of a login page
Library  SeleniumLibrary
Test Teardown   Close browser
          #Test teardown #---- keyword for something that is executed at the end of the test
Test Template   Validate Unsucessfull Login

*** Variables ***
${Error_Message_Login}        css:.alert-danger

*** Test Cases ***      username            password
Invalid username        asdsad              asdsada
Invalid password        rahulshettyacademy  23232
Special characters      @#@!#@!$$           !@#@!#@!#@!

*** Keywords ***
Validate Unsucessfull Login
    [Arguments]     ${username}     ${password}
    open the browser
    fill in the login form  ${username}     ${password}
    verify error message is correct

open the browser
    log                 starting the browser
    open browser        https://rahulshettyacademy.com/loginpagePractise/   chrome

    wait until page contains                (username is rahulshettyacademy and Password is learning)
fill in the login form
    [arguments]             ${username}                     ${password}
    input text              id = username                   ${username}
    input text              id = password                   ${password}
    click button            name = terms
    click button            id = signInBtn
    wait until element is visible               ${Error_Message_Login}

verify error message is correct
    ${result} =     get text             ${Error_Message_Login}
    should be equal as strings           ${result}          Incorrect username/password.
    Element text should be               ${Error_Message_Login}   Incorrect username/password.
    sleep               3s

