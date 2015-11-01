When /^I visit the first speaker's page$/ do 
  visit "/speakers/#{Speaker.first.id}"
end

Then /^I should see all the speakers listed$/ do 
  Speaker.all.each do |speaker|
    expect(page).to have_content(speaker.name)
  end
end

Then /^I should see the first speaker's profile$/ do 
  expect(page).to have_content(Speaker.first.name)
end

Then /^I should not see the last speaker's profile$/ do 
  expect(page).not_to have_content(Speaker.last.name)
end