FactoryBot.define do
  factory :api_v1_current_user_profile, class: API::V1::CurrentUser::All::Profile do
    name         { Faker::Name.name }
    kana         { Faker::Name.name }
    organization { Faker::Company.name }
    introduction { Faker::Lorem.characters(80) }
    image        { fixture_file_upload(Rails.root.join('spec', 'images', 'profile', 'default.jpg'), 'image/jpg') }
  end
end
