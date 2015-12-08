Given /^I am on the speakers page$/ do 
  visit '/speak'
end

Then /^I should see the talk submission form$/ do 
  expect(page).to have_selector 'form#new_talk'
end