Feature: Speakers page
  
  Scenario: Visit speakers page
    Given I am on the speakers page
    Then I should see the text "Speak at Test Ruby PDX"
    Then I should see the text "Suggested Topics"
    And I should see the talk submission form

  Scenario: Submit a valid talk
    Given I am on the speakers page
    When I submit the talk form with valid attributes
    Then I should see the text "Thank you for your submission!"