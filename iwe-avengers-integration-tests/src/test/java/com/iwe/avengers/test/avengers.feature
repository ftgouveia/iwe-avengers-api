Feature: Perform integrated tests on the Avengers registration API

Background:
* url 'https://xrkcf7lxc1.execute-api.us-east-1.amazonaws.com/dev/'

Scenario: Get Avenger by Id

Given path 'avengers', 'aaaa-bbbb-cccc-dddd'
When method get
Then status 200
And match response == {id: '#string', name: '#string', secretIdentity: '#string'}

Scenario: Create a new avengers

Given path 'avengers'
And request {name: 'Captain America', secretIdentity: 'Steve Rogers'}
When method post
Then status 201