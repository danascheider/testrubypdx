Given /^I am not logged in$/ do 
  ensure_logged_out
end

Given /^I am logged in$/ do 
  ensure_logged_in
end

Given /^I'm logged in$/ do 
  step "I am logged in"
end

Given /^I'm not logged in$/ do 
  step "I am not logged in"
end

When /^I visit '(\S*)'$/ do |path|
  visit path
end

Given /^I am a registered user$/ do 
  step 'I visit the "Create a User" page'
  step 'I submit the creation form with valid information'
  @user = User.last
end

Then /^I should be on the '(.*)' page$/ do |path|
  expect(current_path).to eql path
end