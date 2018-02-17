FactoryBot.define do
  factory :post do
    newest_revision_id { Faker::Number.number(2) }
  end
end
