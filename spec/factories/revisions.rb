# == Schema Information
#
# Table name: revisions
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  title      :text
#  summary    :text
#  goal       :text
#  event_url  :text
#  body       :text
#  slide_url  :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  comment    :text
#

FactoryBot.define do
  factory :revision do
    title     { Faker::Lorem.characters(8) }
    summary   { Faker::Lorem.characters(8) }
    goal      { Faker::Lorem.characters(8) }
    comment   { Faker::Lorem.characters(8) }
    event_url { Faker::Lorem.characters(8) }
    body      { Faker::Lorem.characters(8) }
    slide_url { Faker::Lorem.characters(8) }
  end
end
