FactoryGirl.define do
  factory :student do
    house

    sequence(:name){|n| "name#{n}" }
  end
end