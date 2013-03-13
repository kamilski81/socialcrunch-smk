FactoryGirl.define do
  factory :question do
    sequence(:name) { |n| "name #{n}" }
    description "my description"
    gender Constants::FEMALE
  end
end