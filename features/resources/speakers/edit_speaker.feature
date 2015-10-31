Feature: Edit speaker profile
  
  As a group admin
  In order to correct inaccurate information that may have been posted
  to the site
  I need to edit a speaker's profile

  Background:
    Given there is 1 speaker

  Scenario: Logged-in user edits a speaker profile
    Given I am logged in
    When I visit the speaker's edit page
    And I submit the speaker's edit form with the following data:
      | last_name |
      | Dickens   |
    Then the speaker's last_name should be 'Dickens'
    And I should be on the speaker's profile page

  Scenario: Visitor tries to edit a speaker's profile
    Given I am not logged in
    When I visit the speaker's edit page
    Then I should not see the speaker's edit form
    And I should be on the '/login' page

  Scenario: Speaker updated with blank first name
    Given I am logged in
    When I visit the speaker's edit page
    And I submit the speaker's edit form with the following data:
      | first_name | last_name |
      |            | Keats     |
    Then the speaker's first name should not be blank
    And I should be on the speaker's view page