FactoryGirl.define do
  factory :speaker do
    first_name "FirstName"
    sequence :last_name do |n|
      "LastName#{n}"
    end
  end
end
