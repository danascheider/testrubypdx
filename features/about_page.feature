Feature: About page
  
  As a Ruby developer
  To find out if this is a meetup I'm interested in attending or speaking at
  I visit the "About Us" page

  Scenario: Visit about page
    When I visit the "About Us" page
    Then I should see the text 'ABOUT TEST RUBY PDX'