Given /^there (?:is|are) (\d+) meetings?$/ do |count|
  @meeting = FactoryGirl.create(:meeting, {description: 'The quick brown fox jumped over the lazy dog'});
end

Given /^the meeting has (\d+) talks$/ do |count|
  count.to_i.times do 
    FactoryGirl.create(:talk, meeting_id: @meeting.id)
  end
end

When /^I visit the meeting's view page$/ do 
  visit "/meetings/#{@meeting.id}"
end

Then /^I should see the meeting's (\w+)$/ do |attr|
  expect(page).to have_content(@meeting.send(attr.to_sym))
end 