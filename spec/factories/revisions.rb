FactoryBot.define do
  factory :revision do
    title     { Faker::Lorem.characters(8) }
    summary   { Faker::Lorem.characters(8) }
    goal      { Faker::Lorem.characters(8) }
    comment   { Faker::Lorem.characters(8) }
    event_url { Faker::Lorem.characters(8) }
    body      { Faker::Lorem.characters(8) }
    slide_url { Faker::Lorem.characters(8) }
  end
end
