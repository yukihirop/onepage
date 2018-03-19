FactoryBot.define do
  factory :api_v1_current_user_post, class: API::V1::CurrentUser::All::Post do
    newest_revision_id { Faker::Number.number(2).to_i }

    # https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md#associations
    factory :api_v1_current_user_post_with_revisions, class: API::V1::CurrentUser::All::Post do
      transient do
        revisions_count 5
      end

      after(:create) do |post, evaluator|
        create_list(:api_v1_current_user_revision, evaluator.revisions_count, post: post)
        post.update(newest_revision_id: post.revisions.last.id)
      end
    end

    factory :api_v1_current_user_post_with_revisions_and_post_taggings, class: API::V1::CurrentUser::All::Post do
      transient do
        revisions_count 5
        post_taggings_count 5
      end

      after(:create) do |post, evaluator|
        create_list(:api_v1_current_user_revision, evaluator.revisions_count, post: post)
        post.update(newest_revision_id: post.revisions.last.id)
        create_list(:post_tagging, evaluator.post_taggings_count, post: post)
      end
    end
  end
end
