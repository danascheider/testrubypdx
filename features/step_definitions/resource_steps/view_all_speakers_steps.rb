Given /^there are (\d+) speakers$/ do |count|
  FactoryGirl.create_list(:speaker, count.to_i)
end

When /^I visit the page with all the speakers$/ do 
  visit '/speakers'
end

Then /^I should see (\d+) speakers$/ do |count|
  within 'tbody' do 
    expect(page).to have_selector 'tr', :count => count.to_i
  end
end