FactoryBot.define do
  factory :api_v1_user_post_liking, class: API::V1::User::Post::Liking do
    from_user_id { Faker::Number.number(2).to_i }
  end
end
