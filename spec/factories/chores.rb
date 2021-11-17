FactoryBot.define do
  factory :chore do
    name { "Do Dishes" }
    description { "Do all the dishes" }
    done { false }
  end
end