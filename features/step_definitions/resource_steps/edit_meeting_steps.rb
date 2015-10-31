When /^I visit the meeting's edit page$/ do 
  visit "/meetings/#{@meeting.id}/edit"
end

When /^I submit the meeting's edit form with the following data:$/ do |table|
  data = table.hashes[0]

  within "#edit_meeting_#{@meeting.id}" do 
    data.each do |key, value|
      fill_in "meeting[#{key}]", with: value
    end

    click_button 'Update Meeting'
  end
end

Then /^the meeting's (\S+) should be '([^']*)'$/ do |attribute, value|
  @meeting.reload
  expect(@meeting.send(attribute.to_sym)).to eql value
end

Then /^I should be on the meeting's view page$/ do 
  expect(current_path).to eql meeting_path(@meeting)
end