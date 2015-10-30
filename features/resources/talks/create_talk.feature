Feature: Create talk
  
  As an admin
  In order to keep the public informed about what will be discussed
  in our upcoming meetings
  I need to add a talk

  Scenario: Logged-in user creates talk
    Given I am logged in
    When I visit '/talks/new'
    And I fill in the new talk form's 'title' field with 'New Talk'
    And I submit the new talk form
    Then there should be 1 talk called 'New Talk'
    And I should be on the talk's show page

  Scenario: Invalid talk
    Given I am logged in
    When I visit '/talks/new'
    And I submit the new talk form
    Then I should see the '#new_talk' form
    And I should see a message that the talk needs a title

  Scenario: User navigates to talk creation page without logging in
    Given I am not logged in
    When I visit '/talks/new'
    Then I should be on the '/login' page