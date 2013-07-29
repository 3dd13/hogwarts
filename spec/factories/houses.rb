FactoryGirl.define do
  factory :house do
    sequence(:name){|n| "name#{n}" }
  end
end