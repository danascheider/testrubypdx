Given(/^there are no past meetings$/) do 
  Meeting.past.count == 0
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