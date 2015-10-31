Feature: Destroy meeting
  
  As an admin
  In order to avoid confusion after a meeting has been canceled
  I need to delete the meeting from the site

  Background:
    Given there is 1 meeting

  Scenario: Logged-in user destroys meeting
    Given I am logged in
    And I am on the meeting's view page
    When I click the 'Destroy' link
    Then there should be no meetings
    And I should be on the '/meetings/past' page

  Scenario: Visitor can't destroy meeting
    Given I am not logged in 
    And I am on the meeting's view page
    Then I should not see the 'Destroy' link