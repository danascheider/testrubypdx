When /^I visit the page for the talk$/ do 
  visit talk_url(@talk)
end

Then /^I should see the talk's (\S+)$/ do |attribute|
  expect(page).to have_content @talk.send(attribute.to_sym)
end

Then /^I should see the speaker's name$/ do
  expect(page).to have_content @talk.speaker.name
end

Then /^I should see the 'Edit' link$/ do 
  expect(page).to have_link 'Edit'
end

Then /^I should not see the 'Edit' link$/ do 
  expect(page).not_to have_link 'Edit'
end