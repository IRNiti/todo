FactoryBot.define do
  factory :recurrence do
    name { "MyString" }
    description { "MyText" }
    start_date { "2022-01-18" }
    end_date { "2022-01-18" }
    repeat_interval { "" }
    last_instance { "2022-01-18" }
  end
end
