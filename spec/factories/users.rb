# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  email        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  mention_name :string
#

FactoryBot.define do
  factory :user do
    mention_name { Faker::Lorem.characters(5) }
    email        { Faker::Internet.email }

    factory :user_with_profile do
      association :profile, factory: :profile
    end

    trait :with_profile_and_post_likings do
      association :profile, factory: :profile

      transient do
        post_likings_count 5
      end

      after(:create) do |user, evaluator|
        create_list(:post_liking, evaluator.post_likings_count, user: user)
      end
    end
  end
end
