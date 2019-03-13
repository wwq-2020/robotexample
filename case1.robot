*** Settings ***
Documentation 	Simple example using SeleniumLibrary
Library           SeleniumLibrary
Test Setup	Open Browser To Url	${SEARCH URL}	${BROWSER}
Test Teardown	Close Browser


*** Variables***
${SEARCH URL}	http://www.baidu.com
${BROWSER}	chrome
${keyword}	selenium
${input box}	id:kw 	
${button}	id:su
${expected}	selenium_百度搜索


*** Test Cases ***
Search case
	Input keyword	${input box}	${keyword}
	Submit	${button}
	Check


*** Keywords ***
Open Browser To Url
	[Arguments]    ${url}	${browser}
	Open Browser	${url}	${browser}

Input keyword
	[Arguments]    ${input box}	${browser}
	Input text	${input box}	${browser}

Submit
	[Arguments]    ${button}
	click button 	${button}

Check
	Evaluate	time.sleep(2)	time
	${title}	Get Title
	should contain	${title} 	${expected}






