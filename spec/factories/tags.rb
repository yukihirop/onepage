# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :tag do
    name { Faker::Lorem.characters(8) }

    factory :tag_with_post_taggings do
      transient do
        post_taggings_count 5
      end

      after(:create) do |tag, evaluator|
        create_list(:post_tagging, evaluator.post_taggings_count, tag: tag)
      end
    end
  end
end
