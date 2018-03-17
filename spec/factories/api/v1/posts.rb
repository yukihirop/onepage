FactoryBot.define do
  factory :api_v1_post, class: API::V1::All::Post do
    newest_revision_id { Faker::Number.number(2).to_i }

    # https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md#associations
    factory :api_v1_post_with_revision_and_post_likings_and_user, class: API::V1::All::Post do
      association :user, factory: :user

      transient do
        revisions_count 5
        post_likings_count 5
      end

      after(:create) do |post, evaluator|
        create_list(:revision, evaluator.revisions_count, post: post)
        post.update(newest_revision_id: post.revisions.last.id)
        create_list(:post_liking, evaluator.post_likings_count, post: post)
      end
    end
  end
end
