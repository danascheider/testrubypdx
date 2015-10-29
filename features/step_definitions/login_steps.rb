Given /^I am on the login page$/ do 
  visit '/login'
end

When /^I fill in 'username' with my username$/ do 
  within '#login-form' do 
    fill_in 'username', with: @user.name
  end
end

When /^I fill in 'password' with my password$/ do 
  within '#login-form' do 
    fill_in 'password', with: 'foobarbaz' # password comes from User factory
  end
end

When /^I submit the login form$/ do 
  within '#login-form' do 
    click_button 'Login'
  end
end

Then /^I should see the "(.*)" link$/ do |link_text|
  expect(page).to have_link link_text
end

Then /^I should be on the homepage$/ do 
  expect(current_path).to eql '/'
end

Then /^I should be logged in$/ do 
  step 'I should see the text "Logout"'
  step 'I should see the text "Add Meeting"'
end