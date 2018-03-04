FactoryBot.define do
  factory :post_liking, class: Post::Liking do
    from_user_id { Faker::Number.number(2).to_i }
  end
end
