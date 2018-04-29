FactoryBot.define do
  factory :api_v1_tag, class: API::V1::All::Tag do
    name { Faker::Lorem.characters(8) }

    factory :api_v1_tag_with_post_taggings, class: API::V1::All::Tag do
      transient do
        post_taggings_count 5
      end

      after(:create) do |_, evaluator|
        create_list(:api_v1_post_tagging, evaluator.post_taggings_count)
      end
    end
  end
end
