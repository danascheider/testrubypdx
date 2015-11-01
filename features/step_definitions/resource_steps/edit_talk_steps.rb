Given /^there is 1 talk$/ do 
  @talk = FactoryGirl.create(:talk)
end

When /^I visit the edit page for the talk$/ do 
  visit edit_talk_path(@talk)
end

When /^I fill in the '([^']*)' field in the '#edit_talk' form with '([^']*)'$/ do |field, value|
  within "#edit_talk_#{@talk.id}" do 
    fill_in "talk[#{field}]", with: value
  end
end

When /^I select '([^']*)' from the edit talk form's dropdown$/ do |name|
  within "#edit_talk_#{@talk.id}" do 
    select name, from: "talk_speaker_id"
  end
end

When /^I submit the '#edit_talk' form$/ do 
  within "#edit_talk_#{@talk.id}" do 
    click_button "Update Talk"
  end
end

Then /^the talk's (\S*) should be '([^']*)'$/ do |attribute, value|
  @talk.reload
  expect(@talk.send(attribute.to_sym)).to eql value
end

Then /^I should see the '#edit_talk' form$/ do 
  expect(page).to have_selector "#edit_talk_#{@talk.id}"
end

And /^I should see a message that the talk's title can't be blank$/ do 
  expect(page).to have_content 'Title can\'t be blank'
end