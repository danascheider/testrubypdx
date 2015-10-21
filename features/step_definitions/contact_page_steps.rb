When(/^I visit the contact page$/) do 
  visit '/contact'
end

Then(/^I should see the contact form$/) do 
  expect(page).to have_css('#contact-form')
end