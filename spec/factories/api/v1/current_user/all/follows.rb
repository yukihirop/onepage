FactoryBot.define do
  factory :api_v1_current_user_follow, class: API::V1::CurrentUser::All::Follow do
    user_id { create(:api_v1_user).id }
    sequence(:to_user_id, 2)
  end
end
