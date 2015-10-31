Given /^there are no speakers$/ do 
  Speaker.count == 0
end

When /^I submit the '#new_speaker' form with the following data:$/ do |table|
  data = table.hashes[0]

  within '#new_speaker' do 
    data.each do |key, value|
      fill_in "speaker[#{key}]", with: value
    end

    click_button 'Create Speaker'
  end
end

Then /^there should be a new speaker named "([^"]*)"$/ do |name|
  expect(Speaker.last.name).to eql name
end

Then /^I should not see the '#new_speaker' form$/ do 
  expect(page).not_to have_selector '#new_speaker'
end