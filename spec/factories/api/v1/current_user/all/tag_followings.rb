FactoryBot.define do
  factory :api_v1_current_user_tag_following, class: API::V1::CurrentUser::All::TagFollowing do
    association :user, factory: :api_v1_current_user_user
    association :tag,  factory: :api_v1_current_user_tag
  end
end
