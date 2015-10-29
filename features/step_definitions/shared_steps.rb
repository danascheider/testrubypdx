Given(/^I am not logged in$/) do 
  ensure_logged_out
end

Given(/^I am logged in$/) do 
  ensure_logged_in
end

When /^I visit '(\S*)'$/ do |path|
  visit path
end

Given /^I am a registered user$/ do 
  step 'I visit the "Create a User" page'
  step 'I submit the creation form with valid information'
  @user = User.last
end
