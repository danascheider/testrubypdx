Given(/^there are no past meetings$/) do 
  Meeting.past.count == 0
end

Given(/^there are (\d+) past meetings$/) do |count|
  @past_meetings = FactoryGirl.create_list(:past_meeting, count.to_i)
end

Given(/^there (?:is|are) (\d+) upcoming meeting(?:s?)$/) do |count|
  @upcoming_meetings = FactoryGirl.create_list(:upcoming_meeting, count.to_i)
end

When(/^I visit the 'Past Meetings' page$/) do 
  visit '/meetings/past'
end

Then(/^I should see a link to the 'Upcoming Meetings' page$/) do 
  expect(page).to have_css "a[href='/meetings/upcoming']"
end

Then(/^I should see (\d+) meetings listed$/) do|count|
  # The meetings are displayed in a table with one <tr> per meeting, but
  # there is also a <tr> for the header row, hence the + 1
  expect(page).to have_css "tr", count: count.to_i + 1
end