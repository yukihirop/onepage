FactoryBot.define do
  factory :post_like, class: Post::Like do
    from_user_id { Faker::Number.number(2).to_i }
  end
end
