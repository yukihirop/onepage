FactoryBot.define do
  factory :api_v1_post_tagging, class: API::V1::All::PostTagging do
    association :post, factory: :api_v1_post
    association :tag,  factory: :api_v1_tag
  end
end
