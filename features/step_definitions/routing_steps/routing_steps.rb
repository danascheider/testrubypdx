
####### Speakers #######

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

####### Talks #######

When /^I visit the first talk's page$/ do 
  visit "/talks/#{Talk.first.id}"
end

Then /^I should see the first talk's information$/ do 
  expect(page).to have_content(Talk.first.title)
  expect(page).to have_content(Talk.first.speaker.name)
end

Then /^I should not see the last talk's information$/ do 
  expect(page).not_to have_content(Talk.last.title)
end

Then /^I should see all the talks listed$/ do 
  Talk.all.each do |talk|
    expect(page).to have_content(talk.title)
  end
end