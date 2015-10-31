Feature: Edit meeting
  
  As a group admin
  In order to update information being presented to the public,
  I need to edit a meeting

  Background: 
    Given there is 1 meeting

  Scenario: Logged-in user edits meeting
    Given I am logged in
    And I visit the meeting's edit page
    When I submit the meeting's edit form with the following data:
      | description             |
      | This meeting is awesome |
    Then the meeting's description should be 'This meeting is awesome'
    And I should be on the meeting's view page