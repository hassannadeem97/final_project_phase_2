FactoryBot.define do
  
  # TODO: fill in factory blueprint for curriculum
  
  factory :curriculum do
    name "IS"
    min_rating 0
    max_rating 3000
    description " "
    active true
  end
  
  
  factory :location do
    name "ghanim"
    street_1 "al-taei "
    street_2 ""
    city ""
    state ""
    zip "12345"
    max_capacity 200
    active true
  end
  
  factory :instructor do 
    first_name "Hassan"
    last_name "Nadeem"
    email "person@example.com" 
  end 
  
  factory :camp do
    association :curriculum
    association :location
    cost 12.5
    start_date Date.today
    end_date  Date.today
    time_slot "am"
  end 
  
  factory :camp_instructor do 
    association :camp
    association :instructor
  end 
  
end       