Feature: Contact Page

  As a user
  To ask a question or propose a talk for an upcoming meeting
  I need to visit the contact page
  
  Scenario: Visit the contact page
    When I visit the contact page
    Then I should see the text "CONTACT US"
    And I should see the contact form

  Scenario: Submit the contact form
    Given I am on the contact page
    When I submit the contact form
    Then I should see the text "Thank you! Your message has been sent."