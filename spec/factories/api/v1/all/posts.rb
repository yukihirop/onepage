FactoryBot.define do
  factory :api_v1_post, class: API::V1::All::Post do
    newest_revision_id { Faker::Number.number(2).to_i }

    # https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md#associations
    factory :api_v1_post_with_revision_and_post_likings_and_user, class: API::V1::All::Post do
      association :user, factory: [:api_v1_user, :with_profile]

      transient do
        revisions_count 5
        post_likings_count 5
        post_taggings_count 5
        comments_count 5
      end

      after(:create) do |post, evaluator|
        user = post.user
        create_list(:api_v1_revision, evaluator.revisions_count, post: post)
        post.update(newest_revision_id: post.revisions.last.id)
        create_list(:api_v1_post_liking, evaluator.post_likings_count, post: post, user: user)
        create_list(:api_v1_post_tagging, evaluator.post_taggings_count, post: post)
        create_list(:api_v1_comment, evaluator.comments_count, post: post, user: user)
      end
    end

    trait :with_revision do
      transient do
        revisions_count 5
      end

      after(:create) do |post, evaluator|
        create_list(:api_v1_revision, evaluator.revisions_count, post: post)
        post.update(newest_revision_id: post.revisions.last.id)
      end
    end
  end
end
