Given(/^there are no upcoming meetings$/) do 
  Meeting.upcoming.count == 0
end

Given(/^there (?:is|are) (\d+) upcoming meeting(?:s?)$/) do |count|
  @upcoming_meetings = FactoryGirl.create_list(:upcoming_meeting, count.to_i)
end

When(/^I visit the "Upcoming Meetings" page$/) do 
  visit '/meetings/upcoming'
end

Then(/^I should see a link to the Twitter page$/) do 
  expect(page).to have_css "a[href='http://twitter.com/testrubypdx']"
  expect(page).to have_text "Follow @TestRubyPDX on Twitter"
end