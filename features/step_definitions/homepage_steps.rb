Given(/^I am not logged in$/) do 
  ensure_logged_out
end

Given(/^I am logged in$/) do 
  #
end

When(/^I visit the web site$/) do 
  visit '/'
end

Then(/^I should see the text "(.*)"$/) do |text|
  expect(page).to have_content text
end

Then(/^I should not see the text "([^"]*)"$/) do |text|
  expect(page).not_to have_content text
end

Then(/^I should see the top navigation bar$/) do 
  expect(page).to have_css '#top-nav'
end