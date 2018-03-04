FactoryBot.define do
  factory :tag do
    name { Faker::Lorem.characters(8) }
  end
end
