FactoryBot.define do
  factory :api_v1_comment, class: API::V1::All::Comment do
    user_id      { create(:api_v1_user).id }
    post_id      { create(:api_v1_post).id }
    to_user_id   { create(:api_v1_user).id }
    body         { Faker::Lorem.characters(8) }
  end
end
