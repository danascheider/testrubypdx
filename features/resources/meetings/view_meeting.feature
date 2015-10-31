Feature: View meeting
  
  Background:
    Given there is 1 meeting
    And the meeting has 2 talks

  Scenario: View meeting
    Given I am not logged in
    When I visit the meeting's view page
    Then I should see the meeting's display_date
    And I should see the meeting's description
    And I should see information about the talks
    And I should not see the 'Edit' link
    And I should not see the 'Destroy' link

  Scenario: Logged-in user views meeting
    Given I am logged in
    When I visit the meeting's view page
    Then I should see the meeting's display_date
    And I should see the meeting's description
    And I should see information about the talks
    And I should see the 'Edit' link
    And I should see the 'Destroy' link