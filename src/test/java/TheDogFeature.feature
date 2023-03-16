# new feature
# Tags: optional

Feature: Get dog breeds
  Background:
    * def api_key = 'your_api_key_here'
    * def base_url = 'https://api.thedogapi.com/v1'
    * configure headers = { 'x-api-key': '#(api_key)' }

  Scenario: Get all dog breeds
    Given path 'breeds'
    When method get
    Then status 200
    And match response contains { id: '#? _value != null' }

  Scenario: Get a specific dog breed by ID
    Given path 'breeds/{breed_id}'
    And param breed_id = 'your_breed_id_here'
    When method get
    Then status 200
    And match response.id == '#(breed_id)'
    And match response.name == 'Golden Retriever'
    And match response.bred_for == 'Retrieving, hunting'
    And match response.temperament contains 'Intelligent'

  Scenario: Search dog breeds
    Given path 'breeds/search'
    And param q = 'golden retriever'
    When method get
    Then status 200
    And match response contains { name: 'Golden Retriever' }




