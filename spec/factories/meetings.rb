FactoryGirl.define do
  factory :meeting do
    sequence :date do 
      "#{rand(2000..2100)}-#{rand(13)}-#{rand(32)} #{rand(24)}:#{rand(61)}:#{rand(61)}"
    end

    factory :past_meeting do 
      sequence :date do 
        "#{rand(2015)}-#{rand(13)}-#{rand(32)} 18:00:00"
      end
    end

    factory :upcoming_meeting do 
      sequence :date do 
        "#{rand(2017..2200)}-#{rand(13)}-#{rand(32)} 18:00:00"
      end
    end
  end
end
