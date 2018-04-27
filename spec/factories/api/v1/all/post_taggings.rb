FactoryBot.define do
  factory :api_v1_post_tagging, class: API::V1::All::PostTagging do
    sequence(:post_id)
    sequence(:tag_id)

    trait :with_tag do
      tag_id { create(:api_v1_tag).id }
    end
  end
end
