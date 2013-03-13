FactoryGirl.define do
  factory :response do
    question { create(:question) }
    session_id "session_id"
    response Constants::MARRY
    gender_pref Constants::FEMALE
  end
end