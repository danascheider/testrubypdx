FactoryGirl.define do 
  first_name 'John'
  last_name 'Doe'
  sequence :email {|n| "user-#{n}@example.com" }
end