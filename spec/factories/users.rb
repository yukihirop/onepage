# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :user do
    mention_name { Faker::Lorem.characters(5) }
    email        { Faker::Internet.email }

    factory :user_with_profile do
      association :profile, factory: :profile
    end

    trait :with_profile_and_posts do
      association :profile, factory: :profile

      transient do
        posts_count 5
      end

      after(:create) do |user, evaluator|
        create_list(:post, evaluator.posts_count, user: user)
      end
    end
  end
end
