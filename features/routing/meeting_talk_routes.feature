Feature: Meeting talk routes
  
  Background:
    Given there are 2 meetings
    And the first meeting has 2 talks
    And the last meeting has 2 talks
    And I am logged in

  Scenario: Visit route for the talks being given at a particular meeting
    When I visit the page with the talks for the first meeting
    Then I should see the talks for that meeting
    And I should not see the talks for the other meeting

  Scenario: Create a talk for a particular meeting
    When I visit the page to create a talk for the first meeting
    And I submit the '#new_talk' form with the following attributes:
      | title                      |
      | I Think Test::Unit Is Best |
    Then the meeting should have a talk called 'I Think Test::Unit Is Best'
    And I should be on the first meeting's talks page