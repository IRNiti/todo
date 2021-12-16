FactoryBot.define do
  factory :chore do
    name { "Do Dishes" }
    description { "Do all the dishes" }
    done { false }
    user_id { nil }
  end
end