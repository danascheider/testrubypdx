Given /^there are no talks$/ do 
  Talk.count == 0
end

When /^I fill in the new talk form's '([^']*)' field with '([^']*)'$/ do |field, value|
  within '#new_talk' do 
    fill_in "talk[#{field}]", with: value
  end
end

When /^I submit the new talk form$/ do 
  within '#new_talk' do 
    click_button 'Create Talk'
  end
end

When /^I select '([^']*)' from the new talk form's dropdown$/ do |name|
  within "#new_talk" do 
    select name, from: 'talk_speaker_id'
  end
end

When /^I submit the nested speaker form with these attributes:$/ do |table|
  data = table.hashes[0]

  within "#nested_speaker_form" do
    data.each do |key, value|
      fill_in key, with: value
    end

    click_button "Use"
  end
end

Then /^there should be (\d+) talks? called '([^']*)'$/ do |num, title|
  @talk = Talk.find_by(title: title) if num == '1'
  expect(Talk.where(title: title).count).to eql num.to_i
end

Then /^I should be on the talk's show page$/ do
  expect(current_path).to eql "/talks/#{Talk.last.id}"
end

Then /^the talk's speaker should be named '([^']*)'$/ do |name|
  expect(@talk.speaker.name).to eql name
end

Then /^I should see the '#new_talk' form$/ do 
  expect(page).to have_selector '#new_talk'
end

Then /^I should not see the nested speaker form$/ do 
  expect(page).not_to have_selector '#nested_speaker_form'
end

Then /^I should not see the new talk form's select$/ do   
  within "#new_talk" do 
    expect(page).not_to have_selector "select#talk_speaker_id", visible: true
  end
end

Then /^I should see a message that the talk needs a title$/ do 
  expect(page).to have_content 'Title can\'t be blank'
end

Then /^there should be a talk called '([^']*)'$/ do |title|
  @talk = Talk.find_by_title(title)
  expect(@talk).to be_a Talk
end