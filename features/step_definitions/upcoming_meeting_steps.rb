Given(/^there are no upcoming meetings$/) do 
  Meeting.upcoming.count == 0
end

Given(/^there (?:is|are) (\d+) upcoming meeting(?:s?)$/) do |count|
  @upcoming_meetings = FactoryGirl.create_list(:upcoming_meeting, count.to_i)
end

When(/^I visit the "Upcoming Meetings" page$/) do 
  visit '/meetings/upcoming'
end

Then(/^I should see a link to Dana's Twitter page$/) do 
  expect(page).to have_css "a[href='http://twitter.com/danascheider']"
  expect(page).to have_text "Follow @danascheider on Twitter"
end