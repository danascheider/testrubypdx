Feature: View all talks
  
  As a prospective attendee
  In order to find the talk I missed
  I need to view the list of talks

  Background:
    Given there are 4 talks

  Scenario: Logged-in user views list of talks
    Given I'm logged in
    And I'm on the talks page
    Then I should see 4 talks
    And I should see 4 'Edit' links
    And I should see 4 'Destroy' links

  Scenario: Random visitor views list of talks
    Given I'm not logged in
    And I'm on the talks page
    Then I should see 4 talks
    But I should not see the 'Edit' link
    And I should not see the 'Destroy' link