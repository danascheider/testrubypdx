Feature: Add a speaker

  As a group admin
  In order to keep the public up to date about who will be speaking
  at our next event,
  I need to add a new speaker to the database
  
  Background:
    Given there are no speakers

  Scenario: Admin creates a speaker
    Given I am logged in
    When I visit '/speakers/new'
    And I submit the '#new_speaker' form with the following data:
      | first_name | last_name | website              |
      | Dana       | Scheider  | https://tessitura.io |
    Then there should be a new speaker named "Dana Scheider"

  Scenario: Visitor tries to create a speaker
    Given I am not logged in
    When I visit '/speakers/new'
    Then I should not see the '#new_speaker' form
    And I should be on the '/login' page