Feature: Add a speaker

  As a group admin
  In order to keep the public up to date about who will be speaking
  at our next event,
  I need to add a new speaker to the database
  
  Background:
    Given there are no speakers

  Scenario: Admin creates a speaker
    Given I am logged in
    When I visit '/admin'
    And I click the "Add Speakers" link
    And I submit the '#new_speaker' form with the following data:
      | first_name | last_name | website              |
      | Dana       | Scheider  | https://tessitura.io |
    Then there should be a new speaker named "Dana Scheider"
    And I should be on the '/admin' page
    And I should see a message that the speaker was created successfully

  Scenario: Admin creates a speaker with invalid attributes
    Given I am logged in
    When I visit '/admin'
    And I click the "Add Speakers" link
    And I submit the '#new_speaker' form with the following data:
      | last_name |
      | Barclay   |
    Then there should be no speakers
    And I should be on the '/admin' page
    And I should see a message that the speaker was invalid