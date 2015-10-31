Given /^there are (\d+) talks$/ do |count|
  FactoryGirl.create_list(:talk, count.to_i)
end

Given /^I'm on the talks page$/ do 
  visit '/talks'
end

Then /^I should see (\d+) talks$/ do |count|
  within 'tbody' do 
    expect(page).to have_selector 'tr', count: count.to_i
  end
end

Then /^I should see (\d+) '([^']*)' links$/ do |count, text|
  expect(page).to have_link text, count: count.to_i
end