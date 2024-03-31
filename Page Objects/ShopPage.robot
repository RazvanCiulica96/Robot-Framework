*** Settings ***
Documentation  All the page objects and keywords of landing page
Library  SeleniumLibrary

*** Variables ***
${Shop_Page_Load}         css:.nav-link

*** Keywords ***
wait for element to be visible
    Wait Until element passed is located on Page        ${Shop_Page_Load}


Verify Card titles in the Shop page
    @{expectedList} =   Create List         iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${elements}=        Get WebElements     css:.card-title
    @{Actual_list} =    Create List
    FOR   ${element}  IN            @{elements}
          log                ${element.text}
          append to list     ${Actual_list}         ${element.text}
    END
    Lists Should Be Equal       ${expectedList}         ${Actual_list}


Select the Card
    [arguments]     ${cardName}
    ${elements}=    Get WebElements     css:.card-title
    ${index}=   Set Variable    1
     FOR   ${element}  IN            @{elements}
          Exit For Loop If      '${cardName}' == '${element.text}'
          ${index}=  Evaluate   ${index} + 1

     END
    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button