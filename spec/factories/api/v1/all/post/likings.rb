FactoryBot.define do
  factory :api_v1_post_liking, class: API::V1::All::Post::Liking do
    from_user_id { Faker::Number.number(2).to_i }
  end
end
