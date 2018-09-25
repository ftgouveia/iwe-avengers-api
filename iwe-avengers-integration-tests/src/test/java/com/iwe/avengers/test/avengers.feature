Feature: Perform integrated tests on the Avengers registration API

Background:
* url 'https://xrkcf7lxc1.execute-api.us-east-1.amazonaws.com/dev/'

Scenario: Get Avenger by Id

Given path 'avengers', 'aaaa-bbbb-cccc-dddd'
When method get
Then status 200
And match response == {id: '#string', name: '#string', secretIdentity: '#string'}

Scenario: Avenger not found

Given path 'avengers', 'avenger-not-found'
When method get
Then status 404

Scenario: Create a new avenger

Given path 'avengers'
And request {name: 'Captain America', secretIdentity: 'Steve Rogers'}
When method post
Then status 201
And match response == {id: '#string', name: '#string', secretIdentity: '#string'}

Scenario: Create a new avenger with the required data

Given path 'avengers'
And request {name: 'Captain America'}
When method post
Then status 400

Scenario: Delete avenger by id

Given path 'avengers', 'aaaa-bbbb-cccc-dddd'
When method delete
Then status 204

Scenario: Delete avenger not found

Given path 'avengers', 'avenger-not-found'
When method delete
Then status 404

Scenario: update avenger by id

Given path 'avengers', 'aaaa-bbbb-cccc-dddd'
And request {name: 'Hulk', secretIdentity: 'Doctor Banner'}
When method put
Then status 200
And match response == {id: '#string', name: '#string', secretIdentity: '#string'}

Scenario: update avenger not found

Given path 'avengers', 'avenger-not-found'
And request {name: 'Hulk', secretIdentity: 'Doctor Banner'}
When method put
Then status 404

Scenario: update avenger with required data

Given path 'avengers', 'aaaa-bbbb-cccc-dddd'
And request {name: 'Captain America'}
When method put
Then status 400
