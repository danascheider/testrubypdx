When /^I visit the page for the talk$/ do 
  visit talk_url(@talk)
end

Then /^I should see the talk's (\S+)$/ do |attribute|
  expect(page).to have_content @talk.send(attribute.to_sym)
end

Then /^I should see the speaker's (\S+)$/ do |attribute|
  if @speaker
    expect(page).to have_content @speaker.send(attribute.to_sym)
  else
    expect(page).to have_content @talk.speaker.send(attribute.to_sym)
  end
end

Then /^I should see the '(.*)' link$/ do |text|
  expect(page).to have_link text
end

Then /^I should not see the '(.*)' link$/ do |text|
  expect(page).not_to have_link text
end