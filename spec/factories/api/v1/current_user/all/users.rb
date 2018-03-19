FactoryBot.define do
  factory :api_v1_current_user_user, class: API::V1::CurrentUser::All::User do
    mention_name { Faker::Lorem.characters(5) }
    email        { Faker::Internet.email }
  end
end
