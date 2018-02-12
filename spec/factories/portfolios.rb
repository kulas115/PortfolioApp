FactoryBot.define do
  sequence :title do |n|
    "New Portfolio#{n}"
  end

  factory :portfolio do
    title    { generate :title}
    body     "Portfolio body"
    subtitle ""
  end
end
