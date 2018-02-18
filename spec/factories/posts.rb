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
  end
end
