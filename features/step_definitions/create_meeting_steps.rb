Given /^there are no meetings$/ do
  Meeting.count == 0
end

When /^I visit the "Create a Meeting" page$/ do 
  click_link 'Add Meeting'
end

When /^I submit the form to create a meeting$/ do 
  within '#new_meeting' do 
    fill_in 'meeting_date', with: Date.today.to_s
    click_button 'Create Meeting'
  end
end

When /^I click the "([^"]*)" link$/ do |text|
  click_link text
end

Then /^there should be (\d+) meetings?$/ do |count|
  expect(Meeting.count).to eql count.to_i
end

Then /^I should be on the new meeting's view page$/ do 
  expect(current_path).to eql "/meetings/#{Meeting.last.id}"
end

Then /^I should see the meeting creation form$/ do 
  expect(page).to have_css '#new_meeting'
end

Then /^I should have the option to create a talk$/ do 
  expect(page).to have_link 'Add a talk'
end