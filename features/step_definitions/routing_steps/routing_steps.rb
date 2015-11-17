
####### Meetings #######

Given /^the meetings have talks$/ do 
  meetings = @meetings || Meeting.all
  meetings.each do |meeting|
    FactoryGirl.create(:talk, meeting_id: meeting.id)
  end
end

When /^I visit the first meeting's page$/ do 
  visit "/meetings/#{Meeting.first.id}"
end

Then /^I should be on the first speaker's talks page$/ do 
  expect(current_path).to eql "/speakers/#{Speaker.first.id}/talks"
end

Then /^I should be on the first meeting's talks page$/ do 
  expect(current_path).to eql "/meetings/#{Meeting.first.id}/talks"
end

Then /^I should see the first meeting's information$/ do 
  expect(page).to have_content(Meeting.first.display_date)
  expect(page).to have_content(Meeting.first.talks.first.title)
end

Then /^I should not see the last meeting's information$/ do 
  expect(page).not_to have_content(Meeting.last.display_date)
end

Then /^I should see all the past meetings listed$/ do 
  Meeting.past.each do |meeting|
    expect(page).to have_content(meeting.display_date)
  end
end

Then /^I should see all the upcoming meetings listed$/ do 
  Meeting.upcoming.each do |meeting|
    expect(page).to have_content(meeting.display_date)
  end
end

Then /^I should not see the upcoming meetings$/ do 
  Meeting.upcoming.each do |meeting|
    expect(page).not_to have_content(meeting.display_date)
  end
end

Then /^I should not see the past meetings$/ do 
  Meeting.past.each do |meeting|
    expect(page).not_to have_content(meeting.display_date)
  end
end

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

####### Speakers-Talks #######

Given /^the first speaker has (\d+) talks$/ do |count|
  @speaker = Speaker.first
  FactoryGirl.create_list(:talk, count.to_i, speaker_id: @speaker.id)
end

Given /^the last speaker has (\d+) talks$/ do |count|
  FactoryGirl.create_list(:talk, count.to_i, speaker_id: Speaker.last.id)
end

When /^I submit the '\#new_talk' form with the following attributes:$/ do |table|
  attributes = table.hashes.first

  within '#new_talk' do 
    attributes.each do |attribute, value|
      fill_in "talk_#{attribute}", with: value
    end

    click_button 'Create Talk'
  end
end

When /^I visit the page to create a talk for the first speaker$/ do 
  @speaker = Speaker.first
  visit "/speakers/#{@speaker.id}/talks/new"
end

When /^I visit the page for the first speaker's talks$/ do 
  @speaker = Speaker.first
  visit "/speakers/#{@speaker.id}/talks"
end

Then /^I should be on the last talk's page$/ do 
  expect(current_path).to eql talk_path(Talk.last)
end

Then /^I should see all that speaker's talks$/ do 
  @speaker.talks.each do |talk|
    expect(page).to have_content talk.title
  end
end

Then /^I should not see the other talks$/ do 
  talks = Talk.where("speaker_id != ?", @speaker.id)
  talks.each do |talk|
    expect(page).not_to have_content talk.title
  end
end

Then /^the speaker should have a talk called '([^']*)'$/ do |title|
  expect(Talk.where(title: title, speaker_id: @speaker.id)).to exist
end

####### Meetings-Talks #######

Given(/^the first meeting has (\d+) talks$/) do |count|
  Meeting.first.talks = FactoryGirl.create_list(:talk, 2, :meeting_id => Meeting.first.id)
end

Given(/^the last meeting has (\d+) talks$/) do |count|
  Meeting.last.talks = FactoryGirl.create_list(:talk, 2, :meeting_id => Meeting.last.id)
end

When(/^I visit the page with the talks for the first meeting$/) do
  @meeting = Meeting.first
  visit "/meetings/#{@meeting.id}/talks"
end

When(/^I visit the page to create a talk for the first meeting$/) do
  @meeting = Meeting.first
  visit "/meetings/#{@meeting.id}/talks/new"
end

Then(/^I should see the talks for that meeting$/) do
  @meeting.talks.each do |talk|
    expect(page).to have_content talk.title
  end
end

Then(/^I should not see the talks for the other meeting$/) do
  unwanted_talks = Talk.where("meeting_id != ?", @meeting.id)
  unwanted_talks.each do |talk|
    expect(page).not_to have_content talk.title
  end
end

Then(/^the meeting should have a talk called '([^']*)'$/) do |title|
  expect(Talk.where(:meeting_id => @meeting.id, :title => title)).to exist
end