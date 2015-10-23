Given(/^I am on the contact page$/) do 
  step 'I visit the contact page'
end

When(/^I visit the contact page$/) do 
  visit '/contact'
end

When(/^I submit the contact form$/) do 
  fill_in 'name', with: 'John Doe'
  fill_in 'email', with: 'johndoe@example.com'
  fill_in 'subject', with: 'Talk proposal'
  fill_in 'body', with: 'I want to talk about Minitest'
  click_button 'SUBMIT'
end

Then(/^I should see the contact form$/) do 
  expect(page).to have_css('#contact-form')
end