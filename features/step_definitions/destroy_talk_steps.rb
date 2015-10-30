When /^I click the '(.*)' link$/ do |text|
  click_link text
end

Then /^there should be (\d+) talks$/ do |num|
  expect(Talk.count).to eql num.to_i
end

Then /^I should be on the talk index page$/ do 
  expect(current_path).to eql '/talks'
end