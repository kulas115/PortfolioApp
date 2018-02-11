FactoryBot.define do
  sequence :email do |n|
    "tester#{n}@example.com"
  end

  factory :user do
    name     "Norville Rogers"
    email    { generate :email }
    password "foobar"
  end
end
