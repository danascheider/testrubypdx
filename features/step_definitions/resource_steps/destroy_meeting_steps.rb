Given /^I am on the meeting's view page$/ do 
  visit "/meetings/#{@meeting.id}"
end

Then /^there should be no meetings$/ do 
  expect(Meeting.count).to eql 0
end