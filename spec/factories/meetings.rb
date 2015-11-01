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
      sequence :date do 
        "2020-#{rand(13)}-#{rand(32)} #{rand(24)}:#{rand(61)}:00"
      end
    end
  end
end
