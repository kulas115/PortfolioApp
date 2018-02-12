FactoryBot.define do
  sequence :email do |n|
    "tester#{n}@example.com"
  end

  factory :user do
    name     "Norville Rogers"
    email    { generate :email }
    password "foobar"
  end

  factory :admin, class: "User" do
    name      "Admin User"
    email     "admin@example.com"
    password  "foobar"
    roles     "site_admin"
  end
end
