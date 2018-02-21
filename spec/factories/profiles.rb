# == Schema Information
#
# Table name: profiles
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  name         :string
#  kana         :string
#  organization :string
#  introduction :text
#  image        :binary
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryBot.define do
  factory :profile do
    name         { Faker::Name.name }
    kana         { Faker::Name.name }
    organization { Faker::Company.name }
    introduction { Faker::Lorem.characters(80) }
    image        { fixture_file_upload(Rails.root.join('spec', 'images', 'profile', 'default.jpg'), 'image/jpg') }
  end
end
