FactoryBot.define do
  factory :api_v1_current_user_tag, class: API::V1::CurrentUser::All::Tag do
    name { Faker::Lorem.characters(8) }
  end
end
