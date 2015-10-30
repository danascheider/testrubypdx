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

Then /^there should be (\d+) talks? called '([^']*)'$/ do |num, title|
  expect(Talk.where(title: title).count).to eql num.to_i
end

Then /^I should be on the talk's show page$/ do
  expect(current_path).to eql "/talks/#{Talk.last.id}"
end

Then /^I should see the '#new_talk' form$/ do 
  expect(page).to have_selector '#new_talk'
end

Then /^I should see a message that the talk needs a title$/ do 
  expect(page).to have_content 'Title can\'t be blank'
end