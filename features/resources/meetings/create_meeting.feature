Feature: Create Meeting
  
  As an admin
  In order to attract attendees to upcoming events
  I need to add a meeting to the site.

  Background:
    Given I am logged in
    And there are no meetings
    And I visit '/admin'
    When I click the "Add Meetings" link

  Scenario: View form
    Then I should see the meeting creation form
    And I should have the option to create a talk

  Scenario: Logged-in user creates a meeting
    When I submit the form to create a meeting
    Then there should be 1 meeting
    Then I should be on the '/admin' page
    And I should see a message that the meeting has been created

  Scenario: Logged-in user tries to create an invalid meeting
    When I submit the '#new_meeting' form with the following attributes:
      | date |
      |      |
    Then there should be no meetings
    And I should be on the '/admin' page
    And I should see a message that the meeting was invalid