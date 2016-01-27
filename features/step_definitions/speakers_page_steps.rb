Given /^I am on the speakers page$/ do 
  visit '/speak'
end

When /^I submit the talk form with valid attributes$/ do 
  within '#submit_talk' do 
    fill_in 'first_name', with: 'Dana'
    fill_in 'last_name', with: 'Scheider'
    fill_in 'email', with: 'ds@tessitura.io'
    fill_in 'talk_title', with: 'How and Why to Love Cucumber'
    fill_in 'talk_description', with: 'I\'m going to talk about Cucumber'
    click_on 'Submit'
  end
end

Then /^I should see the talk submission form$/ do 
  expect(page).to have_selector 'form#submit_talk'
end