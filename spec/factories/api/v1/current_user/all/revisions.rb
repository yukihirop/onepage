FactoryBot.define do
  factory :api_v1_current_user_revision, class: API::V1::CurrentUser::All::Revision do
    title     { Faker::Lorem.characters(8) }
    summary   { Faker::Lorem.characters(8) }
    goal      { Faker::Lorem.characters(8) }
    comment   { Faker::Lorem.characters(8) }
    event_url { Faker::Lorem.characters(8) }
    body      { Faker::Lorem.characters(8) }
    slide_url { Faker::Lorem.characters(8) }
  end
end
