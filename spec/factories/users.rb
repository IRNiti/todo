FactoryBot.define do
  factory :user do
    name { "Betty" }
    email { "betty.rubble@gmail.com" }
    password { "foobarzz" }
    password_confirmation { "foobarzz" }
  end
end
