# == Schema Information
#
# Table name: posts
#
#  id                 :integer          not null, primary key
#  user_id            :integer
#  newest_revision_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

FactoryBot.define do
  factory :post do
    newest_revision_id { Faker::Number.number(2).to_i }

    # https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md#associations
    factory :post_with_revisions do
      transient do
        revisions_count 5
      end

      after(:create) do |post, evaluator|
        create_list(:revision, evaluator.revisions_count, post: post)
        post.update(newest_revision_id: post.revisions.last.id)
      end
    end

    factory :post_with_revisions_and_post_taggings do
      transient do
        revisions_count 5
        post_taggings_count 5
      end

      after(:create) do |post, evaluator|
        create_list(:revision, evaluator.revisions_count, post: post)
        post.update(newest_revision_id: post.revisions.last.id)
        create_list(:post_tagging, evaluator.post_taggings_count, post: post)
      end
    end

    factory :post_with_revision_and_post_likings_and_user do
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
