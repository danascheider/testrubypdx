FactoryGirl.define do
  factory :meeting do
    date "2015-10-22 18:12:44"

    factory :past_meeting do 
      date "2015-10-22 18:00:00"
    end

    factory :upcoming_meeting do 
      date "2100-10-22 18:00:00"
    end
  end
end
