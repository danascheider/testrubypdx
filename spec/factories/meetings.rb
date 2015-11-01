FactoryGirl.define do
  factory :meeting do
    sequence :date do |n|
      Date.tomorrow - n.weeks
    end

    factory :past_meeting do 
      sequence :date do |n|
        Date.today - n.years
      end
    end

    factory :upcoming_meeting do 
      sequence :date do |n|
        Date.today + n.years
      end
    end
  end
end
