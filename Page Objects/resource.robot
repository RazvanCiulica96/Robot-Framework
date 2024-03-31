*** Settings ***
Documentation  This is a resource file with reusable keywords and variables
Library  SeleniumLibrary



*** Variables ***
${user_name}            rahulshettyacademy
${invalid_password}     12345
${valid_password}     learning
${url}                  https://rahulshettyacademy.com/loginpagePractise/


*** Keywords ***
open the browser
    log                     starting the browser
    Open Browser            ${url}   chrome

    wait until page contains                (username is rahulshettyacademy and Password is learning)


close browser session

    Close Browser


Wait Until element passed is located on Page
    [arguments]             ${page_locator}
    wait until element is visible        ${page_locator}