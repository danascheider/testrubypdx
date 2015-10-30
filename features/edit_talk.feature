Feature: Edit talk
  
  As an admin
  In order to present the most accurate information to the public
  I need to edit one of the talks on the web site

  Background:
    Given there is 1 talk

  Scenario: Logged-in user edits talk
    Given I am logged in
    When I visit the edit page for the talk
    And I fill in the 'description' field in the '#edit_talk' form with 'This talk will be awesome'
    And I submit the '#edit_talk' form
    Then the talk's description should be 'This talk will be awesome'
    And I should be on the talk's show page

  Scenario: Invalid values
    Given I am logged in
    When I visit the edit page for the talk
    And I fill in the 'title' field in the '#edit_talk' form with ''
    And I submit the '#edit_talk' form
    Then I should see the '#edit_talk' form
    And I should see a message that the talk's title can't be blank