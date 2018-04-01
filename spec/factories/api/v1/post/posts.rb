FactoryBot.define do
  factory :api_v1_post_post, class: API::V1::Post::Post do
    newest_revision_id { Faker::Number.number(2).to_i }

    # https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md#associations
    factory :api_v1_post_post_with_post_likings, class: API::V1::Post::Post do
      transient do
        post_likings_count 5
      end

      after(:create) do |post, evaluator|
        create_list(:api_v1_post_post_liking, evaluator.post_likings_count, post: post)
      end
    end
  end
end
