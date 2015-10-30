FactoryGirl.define do
  factory :talk do
    association :speaker
    
    title "MyString"
  end
end