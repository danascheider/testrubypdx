Given /^there is 1 speaker$/ do 
  @speaker = FactoryGirl.create(:speaker, {
    first_name: 'Dana',
    last_name: 'Scheider',
    website: 'http://theagilecoloratura.blogspot.com',
    company: 'Tessitura',
    bio: 'Dana Scheider is the damn best developer in all of Tessitura'
    })
end

Given /^the speaker has (\d+) talks?$/ do |count|
  @speaker.talks = FactoryGirl.create_list(:talk, count.to_i)
end

Given /^I am on the page of the speaker$/ do 
  visit speaker_url(@speaker)
end

Then /^I should see the title of the speaker's talk$/ do 
  expect(page).to have_content @speaker.talks.first.title
end

Then /^I should see the speaker profile$/ do 
  step "I should see the speaker's name"
  step "I should see the speaker's website"
  step "I should see the speaker's company"
  step "I should see the speaker's bio"
end