*** Settings ***
Documentation  This is some basic test for checking the error of a login page
Library         SeleniumLibrary
Library         Collections
Library         ../customLibraries/Shop.py
Resource        ../Page Objects/resource.robot
Resource        ../Page Objects/LandingPage.robot
Resource        ../Page Objects/ShopPage.robot


Test Setup                  open the browser
Suite Setup
Suite Teardown
Test Teardown               close browser session
          #Test teardown #---- keyword for something that is executed at the end of the test



*** Variables ***
${listofProducts}         Blackberry    Nokia Edge

*** Test Cases ***
Validate Unsucessfull Login

    LandingPage.fill in the login form      ${user_name}   ${invalid_password}
    LandingPage.wait for element to be visible
    LandingPage.verify error message is correct

Validate Cards display in the Shopping List
    LandingPage.fill in the login form       ${user_name}              ${valid_password}
    ShopPage.wait for element to be visible
    ShopPage.Verify Card titles in the Shop page
    add items to card and checkout          ${listofProducts}           #this is the custop library, from the customLibraries folder
    # Select the Card         Blackberry

Select the Form and navigate to child window
    LandingPage.fill the login details and form



*** Keywords ***








