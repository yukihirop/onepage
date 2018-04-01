FactoryBot.define do
  factory :api_v1_user_user, class: API::V1::User::User do
    mention_name { Faker::Lorem.characters(5) }
    email        { Faker::Internet.email }

    trait :with_profile_and_post_likings do
      association :profile, factory: :profile

      transient do
        post_likings_count 5
      end

      after(:create) do |user, evaluator|
        create_list(:api_v1_user_post_liking, evaluator.post_likings_count, user: user)
      end
    end
  end
end
