FactoryGirl.define do
  factory :talk do
    association :speaker
    
    sequence :title do |n|
      "Talk #{n}"
    end
  end
end