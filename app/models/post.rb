# == Schema Information
#
# Table name: posts
#
#  id                 :integer          not null, primary key
#  user_id            :integer
#  newest_revision_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Post < ApplicationRecord
  # https://qiita.com/junara/items/ca6f65d2f2a27f185f0e
  belongs_to :user, optional: true

  has_many :revisions, dependent: :destroy
  accepts_nested_attributes_for :revisions

  has_many :post_likings, class_name: 'Post::Liking', dependent: :destroy
  has_many :post_taggings, class_name: 'Post::Tagging', dependent: :destroy
end
