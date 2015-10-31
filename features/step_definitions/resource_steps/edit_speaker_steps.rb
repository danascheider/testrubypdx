When /^I visit the speaker's edit page$/ do 
  visit "/speakers/#{@speaker.id}/edit"
end

When /^I submit the speaker's edit form with the following data:$/ do |table|
  data = table.hashes[0]

  within "#edit_speaker_#{@speaker.id}" do 
    data.each do |key, value|
      fill_in "speaker[#{key}]", with: value
    end

    click_button 'Update Speaker'
  end
end

Then /^the speaker's (\S+) should be '([^']*)'$/ do |attribute, value|
  @speaker.reload
  expect(@speaker.send(attribute.to_sym)).to eql value
end

Then /^I should be on the speaker's profile page$/ do 
  expect(current_path).to eql "/speakers/#{@speaker.id}"
end

Then /^I should not see the speaker's edit form$/ do 
  expect(page).not_to have_selector "#edit_speaker_#{@speaker.id}"
end