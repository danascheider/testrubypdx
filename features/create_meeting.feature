Feature: Create Meeting
  
  As an admin
  In order to attract attendees to upcoming events
  I need to add a meeting to the site.

  Scenario: View form
    Given I am logged in
    When I visit '/meetings/new'
    Then I should see the meeting creation form
    And I should have the option to create a talk

  Scenario: Logged-in user creates a meeting
    Given I am logged in
    And there are no meetings
    When I click the "Add Meeting" link
    And I submit the form to create a meeting
    Then there should be 1 meeting
    And I should be on the new meeting's view page